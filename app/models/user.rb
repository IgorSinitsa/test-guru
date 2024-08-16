class User < ApplicationRecord
  def test_level(level)
    Test.left_outer_joins(:results).find_by(tests.level = level)
  end
end
