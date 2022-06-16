# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :clients, only: %i[index new create show destroy edit update]
  resources :categories, only: %i[index new create destroy edit update]
  resources :products, only: %i[index new create show destroy edit update]
  resources :orders, only: %i[index new create show destroy edit update]

  resources :categories do
    get 'filter_product', on: :member
  end

  get 'product_report', to: 'products#product_report'
end
