Rails.application.routes.draw do

    root to: 'public/homes#top'
    get '/about', to: 'public/homes#about'

    resources :addresses, module: :public, only: [:index, :create, :edit, :update, :destroy]

      delete '/cart_products/destroy_all', to: 'public/cart_products#destroy_all'
    resources :cart_products, module: :public, only: [:index, :update, :destroy]
      post '/cart_products', to: 'public/cart_products#create',  as: 'create_cart_products'

    resources :products, module: :public, only: [:index, :show]
      get '/products/:id/search', to: 'public/products#search' , as: 'genre_searches'

      patch '/customers/withdraw', to: 'public/customers#withdraw'
    resources :customers, module: :public, only: [:edit, :update]
      get '/customers/my_page', to: 'public/customers#show'
      get '/customers/:id/my_page', to: 'public/customers#unsubscribe', as: 'customer_unsubscribe'

    resources :orders, module: :public, only: [:new, :create, :index, :show]
      post '/orders/confirm', to: 'public/orders#confirm'
      get '/orders/thanks', to: 'public/orders#thanks'

    namespace :admin do
      root to: 'homes#top'
      resources :orders, only: [:show, :update] do
        patch '/order_details/:id', to: 'order_details#update', as: 'details'
      end

      resources :genres, only: [:index, :create, :edit, :update, :destroy]
      resources :products
      resources :customers, only: [:index, :show, :edit, :update]
    end

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }
end
