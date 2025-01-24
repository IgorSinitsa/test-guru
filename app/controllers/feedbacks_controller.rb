class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new(author: current_user.nik_name,
                             email: current_user.email,
                             text: "#{t("feedback.new_text")}")
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid? && FeedbacksMailer.send_mail(@feedback).deliver_now
      flash[:notice] = t("feedback.deliver", nik_name: @feedback.author)
      render new_feedback_path
    else
      flash[:notice] = t("feedback.no_deliver")
      render :edit
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:author, :email, :text)
  end
end
