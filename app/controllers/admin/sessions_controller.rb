class Admin::SessionsController < ApplicationController
	layout "admin_login"

	def new; end
	def create
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to admin_url
		else
			redirect_to admin_login_url # Can make this a path in the future possibly
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to admin_login_url
	end
end
