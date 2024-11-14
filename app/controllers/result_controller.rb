class ResultController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index]
  before_action :set_result, only: [:show, :again, :update, :info]

  def show
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

  def set_user
    @user = User.find(id: flash[:user])
  end

  def set_result
    @result = Result.find(params[:id])
  end

  def result_params
    params.require(:result).permit()
  end
end
