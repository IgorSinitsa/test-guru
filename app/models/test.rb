class Test < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: :User
  belongs_to :category
  has_many :results
  has_many :users, through: :results
  has_many :questions

  def category(category)
    joins(:categories).
      where(categories: { title: category }).
      order("tests.title DESC")
    # я так понимаю, что можно с асоциациями написать
    # categories.where(categories: { title: category }).order("tests.title DESC")

  end
end
