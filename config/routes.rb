Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Root route
  root to: 'pages#home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Resources routes for ships and nested bookings
  resources :ships do
    resources :bookings, only: %i[new create edit update destroy]
  end

  # Namespace for user-specific resources
  namespace :my do
    resources :ships, only: %i[new create index edit update destroy]
    resources :bookings, only: %i[index]
  end
end
