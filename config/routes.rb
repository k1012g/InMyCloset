Rails.application.routes.draw do
# top controller
	root to: 'top#top'
	get '/about' => 'top#about', as: 'about'

# devise controller
	devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions'
	}

# users controller
	resources :users, only: [:show, :edit, :update] do
		resource :relationships, only: [:create, :destroy]
		get :follows, on: :member
	    get :followers, on: :member
	end

	get '/following/:id' => 'users#following', as: 'following'
	get '/follower/:id' => 'users#follower', as: 'follower'


# clothes controller
	get '/cloth/new' => 'clothes#new', as: 'new_clothes'
	post '/cloth/new' => 'clothes#create', as: 'create_clothes'
	get '/cloth/edit/:id' => 'clothes#edit', as: 'edit_clothes'
	patch '/cloth/edit/:id' => 'clothes#update', as: 'update_clothes'
	delete '/cloth/delete/:id' => 'clothes#destroy', as: 'destroy_clothes'

# favorites controller
	get '/favorites/:user_id' => 'favorites#show', as: "user_favorite"
	post '/cloth/:cloth_id/favorite' => 'favorites#create', as: 'create_favorite'
	delete '/cloth/:cloth_id/favorite' => 'favorites#destroy', as: 'destroy_favorite'

# categories controller
	resources :categories, only: [:index, :show]

# searches controller
	get '/search' => 'searches#search', as: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
