class RemoveSeoTables < ActiveRecord::Migration[5.0]
  def change
  		drop_table :seo_data
  		drop_table :post_seo_data
  end
end
