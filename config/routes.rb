Rails.application.routes.draw do

  devise_for :users

  resource :questions, only: [:create]

  resource :answers, only: [:create]

  get '/me', to: 'profile#me', as: 'me'

  get '/profile/:username', to: 'profile#show', as: 'profile_show'

  get '/received_questions', to: 'questions#received_questions', as: 'received_questions'

  root 'home#index', as: 'home_index'

end
