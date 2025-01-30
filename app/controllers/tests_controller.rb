class TestsController < ApplicationController
  before_action :set_test, only: [:start]

  def index
    @tests = Test.post_test.order(created_at: :desc)
  end

  def start
    current_user.tests.push(@test) unless current_user.result_id(@test).present?
    redirect_to result_path(current_user.result_id(@test).first)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
