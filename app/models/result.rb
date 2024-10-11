class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true
  before_validation :before_validation_set_questions, on: :create

  def again
    before_validation_set_questions
    self.attempts += 1
    save!
  end

  def accept!(answer_ids)
    info_question = questions[0].to_i
    if info_question != 0
      self.correct_questions += 1 if correct_answer?(answer_ids)
      add_poins
      questions.shift
      add_current_question
      save!
    end
  end

  private

  def add_poins
    self.point = self.total_questions > 0 ? ((self.correct_questions.to_f / self.total_questions.to_f) * 100) : 0
  end

  def array_questions
    test.questions.pluck(:id)
  end

  def before_validation_set_questions
    arr = test.array_questions
    if arr.present?
      self.correct_questions = 0
      self.questions = arr
      self.questions << 0
      self.total_questions = arr.count
    end
    add_current_question
  end

  def add_current_question
    self.current_question = self.questions[0] != 0 ? Question.find(questions[0]) : nil
  end

  def before_save_set_correct_result
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
