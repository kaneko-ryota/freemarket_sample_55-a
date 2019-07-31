Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :users do
    collection do
      get :profile
      get :logout
    end
  end

  resources :user_registrations do
    collection do
      get :new_registration
      get :member_info
      get :phone_number
      get :complete
    end
  end

  resources :products do
    resources :comments
    resources :likes, only: [:create, :destroy]
    member do
      get :purchase_confirmation  
      get :product_state
    end
  end
  resources :addresses
  resources :credits
  resources :product_images
  resources :brands
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
