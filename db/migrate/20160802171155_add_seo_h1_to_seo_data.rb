class AddSeoH1ToSeoData < ActiveRecord::Migration[5.0]
  def change
    add_column :seo_data, :seo_h1, :string
  end
end
