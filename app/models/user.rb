class User < ApplicationRecord
  def test_level(level)
    Test.joins(:results).find_by(test.level = level)
  end
end
