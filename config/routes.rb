Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'

  resources :articles
  resources :formations
  resources :jardins

  resources :rayons do
    resources :categories do
      resources :products
    end
  end

  resources :coffrets

end
