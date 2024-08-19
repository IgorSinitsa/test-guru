class Answer < ApplicationRecord
  belongs_to :question
  scope :correct, -> { where(correct: :true) }
  validate :max_answer, on: :create
  validates :body, presence: true

  private

  def max_answer
    errors.add(:body) if count >= 4
  end
end
