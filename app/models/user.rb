class User < ApplicationRecord
  def self.test_level(level)
    Test.left_outer_joins(:results).find_by(tests.level = level).where(results.user_id = self.id)
  end
end
