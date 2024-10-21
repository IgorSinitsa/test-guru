class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :email
      t.string :password_digest
    end
    remove_column :users, :password
  end
end
