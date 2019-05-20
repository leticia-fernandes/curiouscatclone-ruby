Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'home#home', as: :authenticated_root
  end

  root 'home#index', as: 'home_index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
