class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :body, null: false

      t.timestamps
      t.references :test
    end
  end
end
