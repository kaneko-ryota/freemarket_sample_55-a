Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :users do
    collection do
      get :registration_top
      get :member_info
      get :profile
      get :phone_number
      get :complete
      get :logout
    end
  end
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
