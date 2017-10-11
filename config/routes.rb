Rails.application.routes.draw do
  resources :photos
  devise_for :users
  root to: 'pages#homepage'
end
