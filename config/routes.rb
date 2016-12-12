Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'users', to: 'users#new', as: 'newaccount'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'sessions' => 'sessions#new'
  get '/users/search' => 'users#search'
  post '/users/search' => 'users#search'
  get 'about_us', to: 'page#about_us', as:'about_us'

  resources :users do
    resources :twitter_datum
  end

  get 'page/home'
  root 'page#home'

end
