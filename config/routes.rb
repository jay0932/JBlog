Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users, :posts, :comments, :connections, :categories
	root 'posts#index'
	get '/login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	get 'logout', to: 'sessions#destroy'
	get 'register', to: 'users#new'

	get '/show_my_posts', to: 'users#show_my_posts'

	resources :posts do
    	resources :comments
    	resources :categories
    	resources :connections
  	end
end
