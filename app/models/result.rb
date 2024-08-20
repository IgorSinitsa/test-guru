class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  validates :test_id, presence: true
  # uniqueness: { scope: :user_id }
end
