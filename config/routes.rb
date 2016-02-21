Rails.application.routes.draw do
  devise_for :users, class_name: 'FormUser',
    :controllers => { omniauth_callbacks: 'omniauth_callbacks',
      registrations: 'registrations'}

  root to: "home#index"

  resources :tweets, except: [:edit]
  resources :friends, only: [:create, :destroy]
end
