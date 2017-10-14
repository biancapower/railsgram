Rails.application.routes.draw do
  resources :profiles
  resources :photos
  devise_for :users
  root to: 'pages#homepage'
  # get 'users/sign_out', to: 'pages#homepage'
end
