Rails.application.routes.draw do
	root "posts#index"
	resources :posts, only: ["index", "show"]

	get "/login" => "sessions#new"
	post "/login" => "session#create"
	get "/logout" => "session#destroy"

	get "/register" => "user#new"
	post "/create/user" => "user#create"

	namespace :admin do
		root "dashboard#index", :as => :dashboard

		namespace :dashboard do
			resources :posts, except: ["show"]
			resources :settings

			root "posts#index"
		end
	end
end
