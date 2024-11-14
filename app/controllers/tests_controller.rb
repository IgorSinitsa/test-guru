class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: [:start]

  def index
    @tests = Test.all.order(created_at: :desc)
  end

  def start
    def start
      current_user.tests.push(@test) unless current_user.result_id(@test).present?
      redirect_to result_path(current_user.result_id(@test).first)
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
