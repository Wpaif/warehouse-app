Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :warehouses, except: %i[index]
  resources :suppliers, except: %i[delete]
  resources :product_models, only: %i[index show new create]
end
