Rails.application.routes.draw do
  root 'items#index'

  resource :items, only: [:new, :create] do
    member do
      get 'buy'
    end
  end
  
end
