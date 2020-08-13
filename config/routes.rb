Rails.application.routes.draw do
  root 'items#index'

  resource :items, only: [:new, :create] do
    member do
      get 'buy'
    end
  end
  
  resources :categories, only: [:index,]
end
