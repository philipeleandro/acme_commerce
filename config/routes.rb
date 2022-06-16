Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :clients, only: [:index, :new, :create, :show, :destroy, :edit, :update]
  resources :categories, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :products, only: [:index, :new, :create, :show, :destroy, :edit, :update]
  resources :orders, only: [:index, :new, :create, :show, :destroy, :edit, :update]

  resources :categories do
    get 'filter_product', on: :member
  end

  get 'product_report', to: 'products#product_report'

end
