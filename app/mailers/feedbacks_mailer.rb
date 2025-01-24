class FeedbacksMailer < ApplicationMailer
  MAIN_EMAIL = ENV["MAIN_EMAIL"]

  def send_mail(feedback)
    @text = feedback.text
    @author = feedback.author
    @author_email = feedback.email
    mail(to: MAIN_EMAIL, subject: t("feedback.subject"))
  end
end
