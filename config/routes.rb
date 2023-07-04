Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: 'items#index'
  resources :items  do
  resources :purchasers, only:[:index, :new, :create]
  resources :comments, only: :create
end
end