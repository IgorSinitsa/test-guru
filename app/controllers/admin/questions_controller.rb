class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_test, only: [:new, :create, :index]
  before_action :check_user_author, except: [:show, :index]
  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def show
  end

  def index
    @questions = @test.questions.order(created_at: :desc)
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_path(@test), notice: "Question was succesfuly create"
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: "Question was succesfuly update"
    else
      render :edit
    end
  end

  def destroy
    redirect_to admin_test_path(@question.test), alert: "Question was succesfuly delete" if @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def question_not_found
    render plain: "Question not found"
  end

  def check_user_author
    if current_user.id != @question.test.author_id
      flash[:alert] = "You are not the author of this test."
      redirect_to @question
    end
  end
end
