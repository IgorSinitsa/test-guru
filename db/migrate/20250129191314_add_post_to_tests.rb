class AddPostToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :post, :boolean ,default: false
  end
end
