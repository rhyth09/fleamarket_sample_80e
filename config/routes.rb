Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resource :items, only: [:new, :create] do
    member do
      get 'buy'
    end
  end
  resources :users, only: :show do
    member do
      get 'logout'
    end
  end

end