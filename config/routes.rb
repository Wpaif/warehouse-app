Rails.application.routes.draw do
  root to: 'home#index'
  resources :warehouses, except: %i[index]
  resources :suppliers, except: %i[delete]
  resources :product_models, only: %i[index show new create]
end
