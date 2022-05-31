Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions'}
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


  resources :about_mes, only: [:create, :edit, :update, :destroy]
  resources :articles
  resources :categories, only: [:create, :edit, :update, :destroy]
  resources :coffrets, except: :show
  resources :contacts, only: [:create]
  resources :images, except: :show
  resources :jardins, except: :show
  resources :orders do
    resources :payments, only: :new
  end
  resources :prestation_categories, except: :new, path: 'presta'
  resources :prestations, except: :show
  resources :products
  resources :rayons, except: [:index, :new], path: 'classe'


  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
