Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users, :posts, :comments, :connections, :categories
	root 'users#index'
end
