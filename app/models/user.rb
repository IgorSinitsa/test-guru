class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :recoverable,
         :rememberable,
         :validatable
  has_many :created_tests, foreign_key: :author_id, class_name: :Test
  has_many :results
  has_many :tests, through: :results
  has_many :gists

  def pass_test_level(level)
    tests.level(level)
  end

  def pass_test_easy
    tests.easy
  end

  def result_id(test)
    self.results.where(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
