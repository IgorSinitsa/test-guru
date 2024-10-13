class User < ApplicationRecord
  has_many :created_tests, foreign_key: :author_id, class_name: :Test
  has_many :results
  has_many :tests, through: :results
  validates :name, presence: true,
                   uniqueness: true
  validates :password, presence: true

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
