Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # metamask
  # post '/auth/:provider/callback', to: 'sessions#create'
  # post '/auth/ethereum', to: 'sessions#new'
  root to: 'pages#home'
  get "dashboard", to: "pages#dashboard"
  get "aboutus", to: "pages#aboutus"
  post "/:nft_id/like_toggle", to: "likes#like_toggle", as: "like_toggle"

  resources :galleries do
    member do
      patch :update_order # /galleries/:id/update_order
    end

    resources :nfts, only: %i[index show edit update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
