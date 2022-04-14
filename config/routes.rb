Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'

  resources :articles
  resources :formations
  resources :jardins

  resources :rayons, except: [:show, :index]
  resources :categories, except: [:show, :index]
  resources :products

  resources :coffrets

end
