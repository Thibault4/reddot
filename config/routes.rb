Rails.application.routes.draw do
  get 'registrations/new'
  get 'registrations/create'
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts
  resources :comments
  resources :users
  get '/' => "home#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
