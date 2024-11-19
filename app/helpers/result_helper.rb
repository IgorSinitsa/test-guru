module ResultHelper
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
