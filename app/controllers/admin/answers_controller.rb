class Admin::AnswersController < Admin::BaseController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_question, only: [:new, :create]
  before_action :check_user_author, except: [:show, :index]
  rescue_from ActiveRecord::RecordNotFound, with: :answer_not_found

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to admin_question_path(@question), flash: { success: "Answer was succesfuly create" }
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer, flash: { success: "Answer was succesfuly update" }
    else
      render :edit
    end
  end

  def destroy
    redirect_to admin_question_path(@answer.question), flash: { danger: "Answer was succesfuly destroy" } if @answer.destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def set_answer
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_not_found
    render plain: "Answer not found"
  end

  def check_user_author
    if current_user.id != @question.test.author_id
      flash[:alert] = "You are not the author of this test."
      redirect_to @question
    end
  end
end
