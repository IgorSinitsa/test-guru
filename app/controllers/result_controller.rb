class ResultController < ApplicationController
  before_action :set_result, only: [:show, :again, :update, :info, :gist]

  def show
    @result.again if @result.passed_test?
    render :show
  end

  def gist
    gist_save = GistQuestionService.new(@result.current_question)
    result = gist_save.send_gist

    if gist_save.success?
      Gist.create(
        question: @result.current_question,
        url: result[:html_url],
        user: current_user,
      )
      flash[:notice] = t("text.git_success", gist_url: result[:html_url])
    else
      flash[:alert] = t("text.git_falure")
    end

    redirect_to @result
  end

  def index
    # // тут дожно быть список тестов пройденные пользователем
  end

  def again
    @result.again
    redirect_to result_path(@result)
  end

  def info
    @result.set_poins
    @result.save
  end

  def update
    if @result.passed_test?
      TestsMailer.completed_test(@result).deliver_now
      redirect_to info_result_path(@result)
    else
      @result.accept(params[:answer_ids])
      @result.save
      render :show
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

  def result_params
    params.require(:result).permit()
  end
end
