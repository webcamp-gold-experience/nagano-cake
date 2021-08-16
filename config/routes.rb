Rails.application.routes.draw do

    root to: 'public/homes#top'
    get '/about', to: 'public/homes#about'

    resources :addresses, module: :public, only: [:index, :create, :edit, :update, :destroy]
    resources :cart_products, module: :public, only: [:index, :update, :destroy]
    resources :products, module: :public, only: [:index, :show, :create]

      post '/products/search', to: 'public/products#search'

    resources :orders, module: :public, only: [:create, :index, :show]

      get '/orders/input', to: 'public/oders#input'
      get '/orders/confirm', to: 'public/oders#confirm'
      get '/orders/thanks', to: 'public/oders#thanks'


    namespace :admin do
      resources :orders, only: [:index, :show, :update]
      resources :genres, only: [:index, :create, :edit, :update, :destroy]
      resources :products
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
