Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
  get 'dashboard', to: 'pages#dashboard'

  resources :goats, only: [:show, :new, :create] do
    collection do
      get 'random', to: 'goats#random', as: 'random'
    end
    resources :bookings, only: [:new, :create]
  end
end
