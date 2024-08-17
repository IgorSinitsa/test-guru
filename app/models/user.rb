class User < ApplicationRecord
  has_many :tests, :foreign_key => "author_id"
  has_many :results
  has_many :users, through: :results

  def self.test_level(level)
    Test.left_outer_joins(:results).
      where("tests.level = :level", level: level).
      where(results.user_id = self.id)
  end
end
