Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :users, only: [:show]

  resources :movies do
    collection do
      get :top_rated_movies
    end
    resources :reviews, except: [:show, :index]
    resources :bookings
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'movies#index'
end
