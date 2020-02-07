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
	resources :users, only: [:index, :show, :edit, :update] do
		resource :relationships, only: [:create, :destroy]
		get :follows, on: :member
	    get :followers, on: :member
	end

	get '/follow/:id' => 'users#follow', as: 'follow'


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
	resources :categories, only: [:show]

# searches controller
	get '/search' => 'searches#search', as: 'search'

# 開発環境時のメール確認テスト用
mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
