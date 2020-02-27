Rails.application.routes.draw do
  root to: 'items#home'
  get 'items/map', to: 'items#map', as: :map
  get 'items/search', to: 'items#search', as: :search
  resources :items, except: :home do
    collection do
      get 'lost'
      get 'found'
      get 'new_lost'
      get 'new_found'
    end
    resources :conversations, only: [:create]
  end
  devise_for :users
   resources :users, only: [:show] do
    resources :reviews, only: [:new, :create, :index]
    end
    resources :reviews, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
