Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :users do
    collection do
      get :new_registration
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
    member do
      get :purchase_confirmation
    end
  end
  resources :addresses
  resources :credits
  resources :product_images
  resources :brands
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
