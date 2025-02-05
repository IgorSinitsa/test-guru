class AddTextToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :pass_test, :boolean ,default: false
  end
end
