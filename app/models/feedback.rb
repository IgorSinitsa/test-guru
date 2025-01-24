class Feedback
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :author, :text, :email

  validates :author, :text, presence: true
  validates :text, length: { in: 6..300 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
