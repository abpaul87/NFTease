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
  get 'galleries/:gallery_id/nfts/:id/remove_gala', to: 'nfts#remove_gala', as: :edit_gala
  put "galleries/:gallery_id/nfts/:id/remove_gala", to: "nfts#confirm_gala", as: :editing_gala
  patch "galleries/:gallery_id/nfts/:id/remove_gala", to: "nfts#confirm_gala", as: :edits_gala
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
