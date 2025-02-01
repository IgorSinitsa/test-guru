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
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :badges, through: :user_badges
  has_many :gists, dependent: :destroy
  has_many :user_badges, dependent: :destroy

  def passed_test
    tests.passed
  end

  def pass_test_level(level)
    tests.passed.level(level)
  end

  def pass_test_category(category)
    tests.passed.category_of(category)
  end

  def pass_test_easy
    tests.passed.easy
  end

  def result_id(test)
    self.results.where(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
