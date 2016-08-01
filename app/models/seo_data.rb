class SeoData < ApplicationRecord
	belongs_to :page, polymorphic: true, optional: true
end