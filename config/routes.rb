Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :chatrooms do
    resources :messages
  end
  get '/design', to: 'pages#design'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
