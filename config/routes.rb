Rails.application.routes.draw do

    root to: 'public/homes#top'
    get '/about', to: 'public/homes#about'

    resources :addresses, module: :public, only: [:index, :create, :edit, :update, :destroy]
    resources :cart_products, module: :public, only: [:index, :create, :update, :destroy]
      delete '/cart_products/destroy_all', to: 'public/cart_products#destroy_all'

    resources :products, module: :public, only: [:index, :show]
      # post '/products/search', to: 'public/products#search'
      get '/genres/:id/search', to: 'public/products#search', as: 'genre_searchs'
    resource :customers, module: :public, only: [:edit, :update]
      get '/customers/my_page', to: 'public/customers#show'
      get '/customers/unsubscribe', to: 'public/customers#unsubscribe'
      patch '/customers/withdraw', to: 'public/customers#withdraw'

    resources :orders, module: :public, only: [:new, :create, :index, :show]
      post '/orders/confirm', to: 'public/orders#confirm'
      get '/orders/thanks', to: 'public/orders#thanks'

    namespace :admin do
      root to: 'homes#top'
      resources :orders, only: [:show, :update] do
        patch '/order_details/:id', to: 'order_details#update'
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
