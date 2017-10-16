Rails.application.routes.draw do
  resources :comments
  resources :followers
  resources :profiles
  resources :photos
  devise_for :users

  resources :photos do
    member do
      put 'like', to: 'photos#like'
      put 'dislike', to: 'photos#dislike'
    end
  end

  resources :users do
    member do
      put 'follow', to: 'users#follow'
    end
  end

  get 'profile', to: 'profiles#current'

  # get 'users/all', to: 'profiles'

  root to: 'pages#homepage'
  # get 'users/sign_out', to: 'pages#homepage'
end
