Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'
  get 'contact', to: 'pages#contact'
  get 'cgv', to: 'pages#cgv'

  get 'carts/:id', to: "carts#show", as: 'cart'
  delete 'carts/:id', to: "carts#destroy"

  post 'line_items', to: "line_items#create"
  get 'line_items/:id', to: "line_items#show", as: "line_item"
  delete 'line_items/:id', to: "line_items#destroy"
  post 'line_items/:id/add', to: "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce', to: "line_items#reduce_quantity", as: "line_item_reduce"


  resources :articles
  resources :prestation_categories
  resources :prestations
  resources :jardins

  resources :rayons
  resources :categories
  resources :products
  resources :orders do
    resources :payments, only: :new
  end

  resources :coffrets

  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
