Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:update]

  get :result, to: 'home#result'

  get :console, to: 'home#console'

  # get 'classes/:html', to: 'home#renderer'
  # get 'packeges/:html', to: 'home#renderer'

  root 'home#index'
end
