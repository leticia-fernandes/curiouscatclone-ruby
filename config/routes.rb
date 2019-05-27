Rails.application.routes.draw do
  get 'explore/index'

  get 'explore/show'

  devise_for :users

  get '/profile', to: 'profile#index', as: 'profile_index'

  root 'home#index', as: 'home_index'

end
