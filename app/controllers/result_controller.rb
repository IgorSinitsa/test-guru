class ResultController < ApplicationController
  before_action :set_result, only: [:show, :again, :update, :info]

  def show
    @result.again if @result.passed_test?
    render :show
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
  end

  def update
    @result.accept(params[:answer_ids])
    @result.save
    if @result.passed_test?
      BadgesService.new(@result).give
      TestsMailer.completed_test(@result).deliver_now
      redirect_to info_result_path(@result)
    else
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
