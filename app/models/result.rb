class Result < ApplicationRecord
  belong_to :user
  belong_to :test
  validates :test_id, presence: true,
                      uniqueness: { scope: :user_id }
end
