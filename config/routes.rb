Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users, :posts, :comments, :connections, :categories
	root 'users#index'
	get '/login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	get 'logout', to: 'sessions#destroy'

	get '/show_my_posts', to: 'users#show_my_posts'
end
