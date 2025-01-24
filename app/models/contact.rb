class Contact
  include ActiveModel::Model

  attr_accessor :body, :send_user
  validates :body, :send_user, presence: true
end
