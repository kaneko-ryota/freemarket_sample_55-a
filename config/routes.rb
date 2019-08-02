Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :users do
    collection do
      get :profile
      get :logout
    end
  end

  resources :signup do
    collection do
      get :top
      get :member_info
      get :sms
      get :sms_authentication
      get :user_info
      get :credit
      get :complete
      get :save_session1
    end
  end

  resources :products do
    resources :comments
    resources :likes, only: [:create, :destroy]
    collection do
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
