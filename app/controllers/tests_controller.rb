class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy, :start]
  before_action :set_user, only: [:new, :create, :start]
  before_action :check_user, only: [:edit, :update, :destroy]

  def new
    @test = Test.new
  end

  def index
    @tests = Test.all.order(created_at: :desc)
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :edit
    end
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def show
    @questions = @test.questions.order(created_at: :desc)
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @current_user.tests.push(@test) unless @current_user.result_id(@test).present?

    redirect_to result_path(@current_user.result_id(@test).first)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @current_user = User.first
  end

  def check_result_test(user, test)
    if Result.where(user_id: user.id).where(test_id: test.id).present?
      Result.where(user_id: user.id).where(test_id: test.id)
    else
      result = Result.new(user_id: user.id, test_id: test_id)
      result if result.save
    end
  end

  # тут для проверки свою или чужую запись редактирует
  def check_user
    # @current_user = @test.author_id != @current_user.id ? User.find(@test.author_id) : @current_user
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
