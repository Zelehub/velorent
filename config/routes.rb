Rails.application.routes.draw do
  devise_for :users

  # for testing
  get "biketest/:id", to: "bikes#biketest"
  # finished testing

  root to: "bikes#index"
  # get "/contact", to: "pages#contact"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # resources :user
  patch "orders/:id/pending", to: "orders#set_pending", as: :set_pending
  patch "orders/:id/confirm", to: "orders#set_confirmed", as: :set_confirmed
  patch "orders/:id/reject", to: "orders#set_rejected", as: :set_rejected


  resources :my_bikes, only: [:index]
  resources :checkouts, only: [:show]

  resources :bikes, except: [:index] do
    resources :orders, only: [:create]
  end
  resources :orders
end
