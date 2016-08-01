class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :meta_title
      t.string :meta_description
      t.text :content

      t.timestamps
    end
  end
end
