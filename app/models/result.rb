class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true
  before_validation :before_validation_set_new_questions, on: :create
  before_validation :set_current_question, on: [:create, :update]

  SUCCESS_SCORE = 85
  CORRECTION_INDEX = 1

  def test_passed?
    point >= SUCCESS_SCORE
  end

  def index_question
    total_questions - questions.count + CORRECTION_INDEX
  end

  def again
    before_validation_set_new_questions
    self.attempts += 1
    save!
  end

  def accept(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
  end

  def passed_test?
    questions[0] == 0
  end

  def set_poins
    self.point = self.total_questions > 0 ? ((self.correct_questions.to_f / self.total_questions.to_f) * 100) : 0
  end

  private

  def array_questions
    test.questions.pluck(:id)
  end

  def before_validation_set_new_questions
    arr = test.array_questions
    if arr.present?
      self.correct_questions = 0
      self.questions = arr
      self.questions << 0
      self.total_questions = arr.count
    end
  end

  def set_current_question
    if questions[0] != 0
      self.current_question = Question.find(questions[0])
      questions.shift
    else
      self.current_question = nil
    end
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end
end
