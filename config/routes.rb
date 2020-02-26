Rails.application.routes.draw do

  get 'messages/index'
  get 'messages/new'
  get 'conversations/new'
  get 'conversations/index'
  root to: 'items#home'
  get 'items/map', to: 'items#map', as: :map
  resources :items, except: :home do
    collection do
      get 'lost'
      get 'found'
    end
    resources :conversations, only: [:create]
    #create a nested route for messages
    #do
    #resources :messages
    #end
    #which are absolutely necessary to nest?
    #displaying conversation can be outside
  end
  resources :conversations, only: [:index] do
    resources :messages, only: [:index, :new, :create]
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
