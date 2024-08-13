class Answer < ApplicationRecord
  validates title, presence: true
  validates correct, prepence: true, default: true
  belongs_to :question
end
