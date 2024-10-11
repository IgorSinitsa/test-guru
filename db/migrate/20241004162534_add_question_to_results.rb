class AddQuestionToResults < ActiveRecord::Migration[6.1]
  def change
    change_table :results do |t|
      t.references :current_question, foreign_key: { to_table: :questions }
      t.json :questions, null: false, default: [0]
      t.integer :correct_questions, null: false, default: 0
      t.integer :total_questions, null: false, default: 0
      t.integer :attempts, null: false, default: 0
    end
  end
end
