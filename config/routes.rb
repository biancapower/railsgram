Rails.application.routes.draw do
  resources :followers
  resources :profiles

  devise_for :users

  resources :photos do
    resources :comments
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

  root to: 'pages#homepage'
  # get 'users/sign_out', to: 'pages#homepage'
end
