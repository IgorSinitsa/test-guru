class Test < ApplicationRecord
  def self.category(category)
    Test.joins(:categories).where(categories.title = category).order(tests.title DESC)
  end
end
