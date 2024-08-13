class Question < ApplicationRecord
  validates bode, precence: true
  belongs_to :test
  has_many :questions
end
