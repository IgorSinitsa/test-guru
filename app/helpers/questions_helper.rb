module QuestionsHelper
  TITLES = { new: "Create new", edit: "Edit", show: nil }.freeze

  def question_header(test)
    "#{TITLES[action_name.to_sym]} #{test.title} question"
  end

  def check_valid_question(question)
    question.answers_valid? ? "✓" : "✗"
  end
end
