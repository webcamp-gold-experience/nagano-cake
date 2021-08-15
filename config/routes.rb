Rails.application.routes.draw do

    root to: 'homes#top'
    get '/about', to: 'homes#about'

    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :cart_products, only: [:index, :update, :destroy]
    resources :products, only: [:index, :show, :create]

      post '/products/search', to: 'products#search'

    resources :orders, only: [:create, :index, :show]

      get '/orders/input', to: 'oders#input'
      get '/orders/confirm', to: 'oders#confirm'
      get '/orders/thanks', to: 'oders#thanks'


    namespace :admin do
      resources :orders, only: [:index, :show, :update]
    end

    namespace :admin do
      resources :genres, only: [:index, :create, :edit, :update, :destroy]
    end

    namespace :admin do
      resources :products
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
