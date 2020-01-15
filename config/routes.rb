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
	get '/cloth/edit/:id' => 'clothes#edit', as: 'edit_clothes'
	patch '/cloth/edit/:id' => 'clothes#update', as: 'update_clothes'
	delete '/cloth/delete/:id' => 'clothes#destroy', as: 'destroy_clothes'


# categories controller
	resources :categories, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
