Rails.application.routes.draw do
  devise_for :users, class_name: 'FormUser',
    :controllers => { omniauth_callbacks: 'omniauth_callbacks',
      registrations: 'registrations'}

  root to: "home#index"

  resources :tweets, only: [:index, :create]
  resources :friends, only: [:create, :destroy]
end
