class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :img, null: false
      t.string :code, null: false

      t.timestamps
    end
  end
end
