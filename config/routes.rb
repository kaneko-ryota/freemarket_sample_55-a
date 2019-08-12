Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions'}
  root to: 'products#index'
  resources :users do
    collection do
      get :logout
    end
    member do
      get :profile
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
    member do
      get :purchase_confirmation 
      get :buy
      get :product_state
    end
  end
  resources :addresses
  resources :credits do
    collection do
      post "pay" => "credits#pay"
    end
  end
  resources :product_images
  resources :brands
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end