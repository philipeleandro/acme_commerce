Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :clients, only: [:index, :new, :create, :show, :destroy, :edit, :update]
  resources :categories, only: [:index, :new, :create, :destroy]
end
