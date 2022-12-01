Rails.application.routes.draw do
  get 'ratings/new'
  get 'ratings/create'
  get 'ratings/show'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  devise_for :users
  root to: "pages#home"
  post 'join', to: 'couples#join', as: :join
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :couples, only: %i[new create]
  # Defines the root path route ("/")
  # root "articles#index"
  resources :experiences do
    member do
      patch 'favorite', to: 'favorite', as: :favorite
      patch 'unfavorite', to: 'unfavorite', as: :unfavorite
      patch 'secret', to: 'secret', as: :secret
      patch 'unsecret', to: 'unsecret', as: :unsecret
    end
    collection do
      get 'my_favorite', to: 'my_favorite', as: :my_favorite
      get 'mood', to: 'mood', as: :mood
    end
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :edit, :update] do
    resources :ratings, only: [:new, :create, :show]
  end
  resources :special_days, only: [:index, :create, :destroy]
end
