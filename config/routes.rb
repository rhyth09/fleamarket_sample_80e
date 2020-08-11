Rails.application.routes.draw do
  root 'items#index'
  resource :items, only: [:index, :new, :create]
end
