Rails.application.routes.draw do

  devise_for :users

  get '/me', to: 'profile#me', as: 'me'

  get '/profile/:username', to: 'profile#show', as: 'profile_show'

  root 'home#index', as: 'home_index'


end
