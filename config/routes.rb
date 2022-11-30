Rails.application.routes.draw do
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
    collection do
      get 'my_favorite', to: 'my_favorite', as: :my_favorite
    end
    resources :bookings, only: [:new, :create]
  end
end
