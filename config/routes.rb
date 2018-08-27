Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD
  resources :chatrooms do
    resources :messages
  end
    get '/chatrooms/:chatroom_id/messages', to: 'messages#create', as: :create_message
=======
  get '/design', to: 'pages#design'
>>>>>>> 65e49c17fc2e953d45c916ca81e128867103aabf
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
