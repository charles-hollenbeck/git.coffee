class RemoveSeoDataFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :meta_description, :string
    remove_column :posts, :meta_title, :string
  end
end
