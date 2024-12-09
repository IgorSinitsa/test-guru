module ResultHelper
  def percent_completed_test(result)
    ((result.index_question.to_f / result.test.questions.length) * 100).to_i
  end

  def question_title(result)
    "Questions № #{result.index_question} #{result.current_question.body} question"
  end

  def attempt_title(result)
    "Attempts №#{result.attempts}"
  end

  def show_result_message(result)
    if result.test_passed?
      css_class = "success"
      text = "SUCCESS! Test was completed!"
    else
      css_class = "fail"
      text = "FAIL! Please try again."
    end
    result_body = "<div class = #{css_class}> Scope #{result.point} #{text}"

    safe_join([raw(result_body)])
  end
end
