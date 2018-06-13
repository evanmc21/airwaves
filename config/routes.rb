Rails.application.routes.draw do
  resources :users do
    resources :airlines
  end
  resources :flights


  get '/login' => 'sessions#new'
  post '/sessions', to: 'sessions#create'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  post '/airlines/filter', to: 'airlines#filter'
  post '/flights', to: 'flights#create'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
