Rails.application.routes.draw do
  resources :profiles
  resources :photos
  devise_for :users

  resources :photos do
    member do
      put 'like', to: 'photos#like'
      put 'dislike', to: 'photos#dislike'
    end
  end

  root to: 'pages#homepage'
  # get 'users/sign_out', to: 'pages#homepage'
end
