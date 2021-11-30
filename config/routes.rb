Rails.application.routes.draw do
  devise_for :users
  #metamask
  post '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/ethereum', to: 'sessions#new'
  root to: 'pages#home' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end