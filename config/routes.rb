Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  resources :users do
    resources :shows, only: [:index]
  end
  
  get '/horses/bay_horses', to: 'horses#bay_horses'
  resources :horses do
    resources :shows, only: [:index]
  end

  root 'application#home'
  
  
# fix this route: http://localhost:3000/users/new
 
  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'

  post '/shows', to:"shows#create", as: 'shows'

   # Sessions routes
  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#signedin'
  get '/signout', to: 'sessions#signout'
  
 
  get '/auth/:provider/callback', to: 'sessions#create' # OAuth callback route

end
