Rails.application.routes.draw do
# top controller
	root to: 'top#top'
	get '/about' => 'top#about', as: 'about'

# users controller & devise controller
	devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions'
	}
	resources :users, only: [:index, :show, :edit, :update]


# clothes controller
	get '/clothes' => 'clothes#index', as: 'clothes'
	get '/cloth/new' => 'clothes#new', as: 'new_clothes'
	post '/cloth/new' => 'clothes#create', as: 'create_clothes'
	get '/cloth/edit' => 'clothes#edit', as: 'edit_clothes'
	put '/cloth/edit' => 'clothes#update', as: 'update_clothes'


# categories controller
	resources :categories, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
