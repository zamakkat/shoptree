Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: :index

  namespace :admin do
    resources :products
    resources :categories
  end
end
