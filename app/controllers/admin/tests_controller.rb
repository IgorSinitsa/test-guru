class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: [:show, :edit, :update, :destroy, :start]

  before_action :check_user_author, only: [:edit, :update, :destroy]

  def new
    @test = Test.new
  end

  def index
    if params[:view_test] == "all"
      @tests = Test.all.order(created_at: :desc)
    else
      @tests = current_user.created_tests
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def create
    @test = current_user.created_tests.new(test_params)
    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def show
    @questions = @test.questions.order(created_at: :desc)
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def check_user_author
    if current_user.id != @test.author_id
      flash[:alert] = "You are not the author of this test."
      redirect_to admin_tests_path
    end
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
