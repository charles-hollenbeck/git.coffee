Rails.application.routes.draw do
	root "posts#index"

	get "/posts" => "posts#index", as: "posts"
	get "/post/:id" => "posts#show", as: "post"

	namespace :admin do
		resources :posts, path_names: { show: "preview" }
		resources :settings, only: [:edit, :update, :index]
		resources :users

		get "/" => :index

		scope :controller => :sessions do
			get "login" => :new
			post "login" => :create
			get "logout" => :destroy
		end
	end
end