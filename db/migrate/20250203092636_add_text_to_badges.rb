class AddTextToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :text, :string, default: ""
  end
end
