class User < ApplicationRecord
  def test_level(level)
    Test.find_by(level: level)
  end
end
