class User < ApplicationRecord
  has_many :created_tests, foreign_key: :author_id, class_name: :Test
  has_many :results
  has_many :tests, through: :results
  validates :name, presence: true,
                   uniqueness: true
  validates :password, presence: true
  scope :test_level, ->(level) { joins(:tests).merge(Test.level(level)) }
  scope :all_test_level, ->(level) { Test.level(level) }

  def self.level(level)
    test_level(level)
  end

  def user_level(level)
    User.test_level(level)
  end
end
