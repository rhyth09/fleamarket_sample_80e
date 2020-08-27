Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'users', to: 'users/registrations#new'
  end

  root 'items#index'
  
  resources :categories, only: [:index,]

  resources :users, only: [:show] do
    member do
      get 'sales_items'
      get 'sold_items'
      get 'logout'
    end
    collection do
      get 'commented_items'
    end
  end
  
  resources :items do
    resources :comments, only: [:create, :destroy]
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
    resources :purchase, only: [:index] do
      collection do
        get 'done', to: 'purchase#done'
        post 'pay', to: 'purchase#pay'
      end
    end
  end


  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end


end