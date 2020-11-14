Rails.application.routes.draw do
  get 'borrow/borrowed'
  get 'borrow/read'
  get 'borrow/unread'
  get 'borrow/random'

  get 'welcome/index'

  resources :books
  resources :tags, only: [:index, :show]

  root 'welcome#index'

  # Routes for user
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
