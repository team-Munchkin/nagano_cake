Rails.application.routes.draw do
  devise_for :customers,skip: [:password], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admins, skip: [:registration, :password], controllers: {
    sessions: "admin/sessions"
  }
  root to: "homes#top"
  get "/about" => "homes#about"
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :update, :destroy, :create] do
    delete :destroy_all, on: :collection
  end
  resource :customers, only: [:show, :edit, :update] do
    get :unscribe, on: :collection
    patch :withdrawl, on: :collection
  end
  resources :orders, only: [:create, :index, :show, :new] do
    post :confirm, on: :collection
    get :complete, on: :collection
  end
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  namespace :admin do
    root to: "homes#top"
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:show, :update, :edit, :index]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
