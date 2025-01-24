class ContactMailer < ApplicationMailer
  def text_send(contact)
    @user = contact.send_user
    @body = contact.body

    mail to: @user.email
  end
end
