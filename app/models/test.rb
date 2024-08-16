class Test < ApplicationRecord
  def category(category)
    joins(:categories).where(categories.title = category).order("tests.title DESC")
  end
end
