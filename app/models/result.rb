class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  validates :test_id, presence: true
  validates :user_id, presence: true
end
