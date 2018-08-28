Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events
  resources :chatrooms do
    resources :messages
  end
  get '/chatrooms/:chatroom_id/messages', to: 'messages#create', as: :create_message
  get '/design', to: 'pages#design'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
