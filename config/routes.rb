Rails.application.routes.draw do
  root 'items#index'
  resource :items, only: [:new,]

  resource :items do
    member do
      get 'buy'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
