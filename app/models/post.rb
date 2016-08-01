class Post < ApplicationRecord
	has_one :seo_data,
			:as => :page,
			:dependent => :destroy

	accepts_nested_attributes_for :seo_data
end