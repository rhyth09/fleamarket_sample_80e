Rails.application.routes.draw do
  root 'items#index'

  resource :items, only: [:new, :create] do
    member do
      get 'buy'
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  
  resources :categories, only: [:index,]
end
