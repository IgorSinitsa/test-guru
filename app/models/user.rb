class User < ApplicationRecord
  has_many :created_tests, foreign_key: :author_id, class_name: :Test
  has_many :results
  has_many :tests, through: :results
  validates :user, presence: true,
                   uniqueness: true
  VALID_EMAIL_PATTERN = /\A\w+@\w+\.\w+\z/

  validates :email, presence: true,
                    format: VALID_EMAIL_PATTERN,
                    uniqueness: { case_sensitive: false }

  has_secure_password

  def self.authenticate(email:, password:)
    user = User.find_by(email: email)
    user&.authenticate(password)
  end

  def pass_test_level(level)
    tests.level(level)
  end

  def pass_test_easy
    tests.easy
  end

  def result_id(test)
    self.results.where(test_id: test.id)
  end
end
