Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  # resources :products
  resources :products do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :addresses
  resources :credits
  resources :product_images
  resources :brands
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
