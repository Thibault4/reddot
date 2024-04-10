Rails.application.routes.draw do
  root 'home#index'
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  resources :comments
  resources :users
  delete 'logout' => 'sessions#destroy', as: :logout
  get "up" => "rails/health#show", as: :rails_health_check
end
