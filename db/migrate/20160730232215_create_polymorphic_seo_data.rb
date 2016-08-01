class CreatePolymorphicSeoData < ActiveRecord::Migration[5.0]
  def change
    create_table :seo_data do |t|
    	t.string :meta_title
    	t.string :meta_description
    	t.string :meta_robots
    	t.references :page, polymorphic: true, index: true
    	t.timestamps
	end
  end
end
