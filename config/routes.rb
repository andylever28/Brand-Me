Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

  # For when Twitter has successfully authenticated and sent us back to the app
  # allows us to take response & save API keys for the user so we can use Twitter on their behalf
  get 'auth/:provider/callback' , to: 'sessions#create'

  resources :users do
    resources :twitter_datum
  end

  get 'page/home'
  root 'page#home'

end
