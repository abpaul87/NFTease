Rails.application.routes.draw do
  devise_for :users
  # metamask
  # post '/auth/:provider/callback', to: 'sessions#create'
  # post '/auth/ethereum', to: 'sessions#new'
  root to: 'pages#home'
  get "dashboard", to: "pages#dashboard"
  get "aboutus", to: "pages#aboutus"
  resources :galleries do
    resources :nfts, only: %i[index show edit update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
