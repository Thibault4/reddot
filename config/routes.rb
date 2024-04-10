Rails.application.routes.draw do
  root 'home#index'
  resources :registrations
  resources :sessions, only: [:new, :create]
  resources :posts do
    resources :comments do
      get '/add', to: 'comments#new', as: :add_child_comment
      post '/', to: 'comments#create', as: :add_child_comment_parent
    end
  end
  resources :comments
  resources :users
  delete 'logout' => 'sessions#destroy', as: :logout
  get "up" => "rails/health#show", as: :rails_health_check
end
