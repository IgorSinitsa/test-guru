class User < ApplicationRecord
  has_many :author, foreign_key: :author_id, class_name: :Test
  has_many :results
  has_many :tests, through: :results

  def self.test_level(level)
    self.tests.where(tests: { level: level })
  end
end
