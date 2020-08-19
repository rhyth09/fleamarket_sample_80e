Rails.application.routes.draw do



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # devise_for :users, controllers: {
    # registrations: 'users/registrations',
  # }
  # devise_scope :user do
    # get 'addresses', to: 'users/registrations#new_address'
    # post 'addresses', to: 'users/registrations#create_address'
  # end

  root 'items#index'
  resources :items, only: [:new, :create, :show] do
    member do
      get 'buy'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
      get 'search'
      get 'post_done'
      get 'delete_done'
      get 'detail_search'
      get 'update_done'
    end
  end
  resources :categories, only: [:index,]
  resources :users, only: [:show]
  resources :cards, only: [:new]


end
