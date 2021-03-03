Rails.application.routes.draw do
  root 'events#index'
  resources :user, only: [:new, :create, :show]
  resources :event
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
