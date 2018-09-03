Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  mount ActionCable.server => "/cable"

  resources :events do
    resources :user_events, only: :create
    resources :chatrooms, only: [:create, :new, :edit, :update]
    resources :user_chatrooms, only: :create
  end
  get '/users_chatroom', to: 'events#users_chatroom'
  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
    resources :alerts, only: [:create]
  end
  resources :alerts, only: [] do
    resources :alert_solvers, only: [:create]
  end
  get '/design', to: 'pages#design'
  get '/designshow', to: 'pages#designshow'
end


