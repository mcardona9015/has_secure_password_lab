Rails.application.routes.draw do
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/welcome', to: 'users#welcome', as: 'welcome'

  get '/users/login', to: 'sessions#new', as: 'login'
  post '/users/login', to: 'sessions#create'
  delete '/users/logout', to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
