module ResultHelper
  def question_title(result)
    "Questions № #{result.total_questions - result.questions.count + 2} #{result.current_question.body} question"
  end

  def attempt_title(result)
    "Attempts №#{result.attempts}"
  end

  def show_result_message(result)
    if result.point >= 85
      out = "SUCCESS! Test was completed!"
    else
      out = "FAIL! Please try again."
    end
    "Scope #{result.point} #{out}"
  end
end
