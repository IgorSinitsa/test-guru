class AddNameAndTyprAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :type, :string, null: false, default: "User"
    change_column_default(:users, :nik_name, "")
    add_index :users, :type
  end
end
