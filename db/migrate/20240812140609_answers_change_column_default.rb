class AnswersChangeColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :answers, :correct, from: nil, to: true
  end
end
