Rails.application.routes.draw do

  resources :items, except: :home do
    collection do
      get 'lost'
      get 'found'
    end
    resources :conversations, only: [:create]
  end

  devise_for :users
  root to: 'items#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
