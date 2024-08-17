class Test < ApplicationRecord
  belongs_to :user, :foreign_key => "author_id"
  has_many :results
  has_many :users, through: :results
  has_many :questions

  def category(category)
    joins(:categories).
      where("categories.title = :category", category: category).
      order("tests.title DESC")
  end
end
