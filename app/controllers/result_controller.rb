class ResultController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :set_result, only: [:show, :again, :update]

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

  def update
    @result.accept!(params[:answer_ids])
    render :show
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
