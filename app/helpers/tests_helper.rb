module TestsHelper
  def check_edit_current_user(test)
    current_user.id == test.author_id ? "✓" : "✗"
  end
  def post?(test)
    test.post ?  "Опубликовано": "Черновик"
  end
end
