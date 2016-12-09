Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/users/search' => 'users#search'
  post '/users/search' => 'users#search'

  resources :users do
    resources :twitter_datum
  end

  get 'page/home'
  root 'page#home'

end
