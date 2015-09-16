Rails.application.routes.draw do
  get 'pages/home'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :users
  resources :images
  resources :datasets
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  root to: 'pages#home'
end
