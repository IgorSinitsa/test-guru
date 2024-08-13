class Test < ApplicationRecord
  validates body, presence: true
  validates level, prepence: true, default: 1
  has_many :questions
  belongs_to :categories
end
