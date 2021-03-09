Rails.application.routes.draw do
  root 'events#index'
  resources :users, only: [:new, :create, :show]
  resources :events
  resources :event_attendances

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  post '/confirm_attendance', to: 'event_attendances#create'

  # resources :events do
  #   post 'attend', on: :member
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
