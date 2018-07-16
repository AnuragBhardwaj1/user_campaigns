Rails.application.routes.draw do
  root 'welcome#show'
  get 'login', to: 'sessions#new', as: :login

  concern :commentable do
    resources :comments, only: :create
  end

  resource :welcome, controller: :welcome, only: :show
  resource :session
  resources :users
  resources :campaigns, concerns: :commentable do
    resources :todos, only: [:new, :create, :update]
  end

  resources :todos, concerns: :commentable, only: [:show]


  namespace :admin do
    resources :users
  end

end
