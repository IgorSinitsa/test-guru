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
end
