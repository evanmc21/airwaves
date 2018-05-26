Rails.application.routes.draw do
  resources :users do
    resources :flights
  end
  resources :airlines

  get '/login' => 'sessions#new'
  post '/sessions', to: 'sessions#create'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  post '/flights/filter', to: 'flights#index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
