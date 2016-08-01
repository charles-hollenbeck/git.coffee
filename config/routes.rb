Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
  end

	resources :settings
	resources :posts

	root "application#index"

	namespace :admin do
		get "", to: "dashboard#index", as: "/"
	end
end
