Rails.application.routes.draw do
  root 'items#index'
  resource :items, only: [:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :show
end
