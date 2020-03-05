Rails.application.routes.draw do
  root to: 'items#home'
  get 'items/map', to: 'items#map', as: :map
  get 'items/search', to: 'items#search', as: :search
  get 'items/presentation', to: 'items#presentation', as: :presentation

  mount ActionCable.server, at: '/cable'

  resources :items, except: :home do
    get 'edit_lost', to: 'items#edit_lost', as: :edit_lost
    get 'edit_found', to: 'items#edit_found', as: :edit_found
    member do
      patch :solved
    end
    collection do
      get 'lost'
      get 'found'
      get 'new_lost'
      get 'new_found'
    end
    resources :conversations, only: [:create, :new]
  end

  resources :conversations, only: [:index, :show, :destroy] do
    resources :messages, only: [:index, :new, :create]
  end

  devise_for :users
   resources :users, only: [:show] do
    resources :reviews, only: [:new, :create, :index]
    end
    resources :reviews, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
