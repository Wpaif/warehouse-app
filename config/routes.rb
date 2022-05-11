Rails.application.routes.draw do
  root to: 'home#index'
  resources :warehouses, except: %i[index]
  resources :suppliers, only: %i[index show new edit update create]
end
