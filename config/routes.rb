Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :tweets, except: [:edit]

  root to: "home#index"
end
