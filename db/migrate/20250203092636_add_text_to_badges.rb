class AddTextToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :pass_test, :boolean ,default: false
    add_column :results, :start_test, :datetime
    add_column :results, :end_test, :datetime
    add_column :tests, :duration, :integer ,default: 0
  end
end
