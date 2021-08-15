Rails.application.routes.draw do

    root to: 'public/homes#top'
    get '/about', to: 'public/homes#about'


    resources :addresses, module: :public, only: [:index, :create, :edit, :update, :destroy]
    resources :cart_products, module: :public, only: [:index, :update, :destroy]
    resources :products, module: :public, only: [:index, :show, :create]

      post '/products/search', to: 'public/products#search'

    resources :orders, module: :public, only: [:create, :index, :show]

      get '/orders/input', to: 'public/orders#input'
      get '/orders/confirm', to: 'public/orders#confirm'
      get '/orders/thanks', to: 'public/orders#thanks'


    namespace :admin do
      resources :orders, only: [:index, :show, :update]
      resources :genres, only: [:index, :create, :edit, :update, :destroy]
      resources :products
    end


  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  devise_for :custmers, controllers: {
  sessions:      'custmers/sessions',
  passwords:     'custmers/passwords',
  registrations: 'custmers/registrations'
  }

end
