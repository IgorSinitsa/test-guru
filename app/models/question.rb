class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy
  validates :body, presence: true

  scope :valid, -> {joins(:answers).where("answers.correct = ?", true).group('questions.id')}

  def answers_valid?
    self.answers.where(correct: :true).size >=1
  end

end
