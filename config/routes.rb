Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#hello'
  
  resources :users
  resources :sessions, only: [:new, :create, :delete]

  

  # Sessions routes
get '/login', to: 'sessions#new', as: 'login'
get '/auth/:provider/callback', to: 'sessions#create' # OAuth callback route
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
end
