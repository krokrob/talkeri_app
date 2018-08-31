Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :events do
    resources :user_events, only: :create
    resources :chatrooms, only: [:create, :new, :edit]
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


