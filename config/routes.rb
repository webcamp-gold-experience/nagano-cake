Rails.application.routes.draw do

    root to: 'public/homes#top'
    get '/about', to: 'public/homes#about'
<<<<<<< HEAD

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
=======
    
    resources :addresses, module: :public, only: [:index, :create, :edit, :update, :destroy]
    resources :cart_products, module: :public, only: [:index, :create, :update, :destroy]
      delete '/cart_products/destroy_all', to: 'public/cart_products#destroy_all'
      
    resources :products, module: :public, only: [:index, :show]
      post '/products/search', to: 'public/products#search'
      
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
      
>>>>>>> origin/develop
      resources :genres, only: [:index, :create, :edit, :update, :destroy]
      resources :products
      resources :customers, only: [:index, :show, :edit, :update]
    end
<<<<<<< HEAD

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
=======
    
  #devise_for :admins, controllers: {
  #sessions:      'admins/sessions',
  #passwords:     'admins/passwords',
  #registrations: 'admins/registrations'
  #}
  
  #devise_for :customers, controllers: {
  #sessions:      'customers/sessions',
  #passwords:     'customers/passwords',
  #registrations: 'customers/registrations'
  #}
end
>>>>>>> origin/develop
