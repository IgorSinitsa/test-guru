class User < ApplicationRecord
  has_many :created_tests, foreign_key: :author_id, class_name: :Test
  has_many :results
  has_many :tests, through: :results
  validates :name, presence: true,
                   uniqueness: true
  validates :password, presence: true
  scope :test_level, ->(level) { tests.where(level: level) }
  # def self.test_level(level)
  #   self.tests.where(tests: { level: level })
  # end
end
