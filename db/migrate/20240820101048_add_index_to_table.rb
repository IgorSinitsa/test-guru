class AddIndexToTable < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, [:title, :level]
  end
end
