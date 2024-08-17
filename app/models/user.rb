class User < ApplicationRecord
  def self.test_level(level)
    Test.left_outer_joins(:results).
    where("tests.level = :level", level: level).
    where(results.user_id = self.id)
  end
end
