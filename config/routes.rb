Rails.application.routes.draw do

  root to: 'items#home'
  get 'items/map', to: 'items#map', as: :map
  resources :items, except: :home do
    resources :conversations, only: [:create]
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
