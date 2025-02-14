class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true
  before_validation :before_validation_set_new_questions, on: :create
  before_validation :update_result, on: [:update]
  # before_validation :set_current_question, on: [:create, :update]

  SUCCESS_SCORE = 85

  def test_passed?
    pass_test
  end

  def passed_test?
    current_question.nil?
  end

  def index_question
    total_questions - questions.count
  end

  def again
    before_validation_set_new_questions
    self.attempts += 1
    save!
  end

  def accept(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
  end

  private

  def set_poins
    self.point = self.total_questions > 0 ? ((self.correct_questions.to_f / self.total_questions.to_f) * 100) : 0
  end

  def array_questions
    test.questions.pluck(:id)
  end

  def before_validation_set_new_questions
    arr = test.array_questions_valid
    if arr.present?
      self.correct_questions = 0
      self.questions = arr.sort_by { rand }
      self.total_questions = arr.count
      self.start_test = DateTime.current
      self.end_test = start_test + (self.test.duration).minutes
    end
  end

  def update_result
    if self.questions.empty? || (self.test.duration > 0 && self.end_test < DateTime.current)
      set_poins
      self.pass_test = self.point >= SUCCESS_SCORE ? true : false
      self.questions = []
      self.current_question = nil
    else
      set_current_question
    end
  end

  def set_current_question
    self.current_question = Question.find(questions[0])
    self.questions.shift
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
