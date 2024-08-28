class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]
  before_action :check_user, only: [:edit, :update, :destroy]

  def new
    @test = Test.new
  end

  def index
    @tests = Test.all.order created_at: :desc
    respond_to do |format|
      format.html { }
      format.json { render json: { tests: @tests } }
    end
  end

  def update
    if @test.update test_params
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
    @questions = @test.questions.order created_at: :desc
  end

  def destroy
    # @test.questions.clear
    @test.results.clear
    @test.users.clear

    @test.destroy
    redirect_to tests_path
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @current_user = User.first
  end

  # тут для проверки свою или чужую запись редактирует
  def check_user
    # @current_user = @test.author_id != @current_user.id ? User.find(@test.author_id) : @current_user
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
