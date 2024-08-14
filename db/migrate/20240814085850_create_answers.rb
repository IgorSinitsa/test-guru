class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, null: false, default: false

      t.timestamps
      t.references :question
    end
  end
end
