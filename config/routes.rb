Rails.application.routes.draw do
	root "posts#index"
	resources :posts, only: ["index", "show"]

	namespace :admin do
		root "dashboard#index"

		namespace :dashboard do
			resources :posts, except: ["show"]
			resources :settings

			root "posts#index"
		end
	end
end
