class RemoteTestFromUserBadges < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_badges, :test_id, :bigint
  end
end
