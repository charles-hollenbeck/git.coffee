class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def initialize()
		@seo_meta_title = "Default" # Set Default Later
		@seo_meta_description = "Default Meta Description" # Set Default Later
		@seo_meta_robots = "index,follow" # Set Default Later
		@seo_h1 = "Default H1"
		super
	end

	def set_title(new_title)
		@seo_meta_title = new_title
  	end

	def set_meta_description(new_description)
		@seo_meta_description = new_description
  	end

	def set_meta_robots(new_robots)
		@seo_meta_robots = new_robots
  	end

	def set_h1(new_h1)
		@seo_h1 = new_h1
  	end
end
