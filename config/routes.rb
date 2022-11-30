Rails.application.routes.draw do
  get 'ratings/new'
  get 'ratings/create'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :couples, only: [:new, :edit, :update]
  # Defines the root path route ("/")
  # root "articles#index"
  resources :experiences do
    member do
      patch 'favorite', to: 'favorite', as: :favorite
      patch 'unfavorite', to: 'unfavorite', as: :unfavorite
    end

    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :edit, :update] do
    resources :ratings, only: [:new, :create ]
  end
end
