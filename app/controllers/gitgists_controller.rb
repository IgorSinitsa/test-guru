class GitgistsController < ApplicationController
  before_action :set_result, only: [:create]

  def create
    gist_save = GistQuestionService.new(@result.current_question)
    result = gist_save.send_gist

    if gist_save.success?
      current_user.gists.create(
        question: @result.current_question,
        url: result[:html_url],

      )
      flash[:notice] = t("text.git_success", gist_url: result[:html_url])
    else
      flash[:alert] = t("text.git_falure")
    end

    redirect_to @result
  end

  def set_result
    @result = Result.find(params[:result])
  end
end
