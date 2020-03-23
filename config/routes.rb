Rails.application.routes.draw do
  get 'borrow/borrowed'
  get 'borrow/read'
  get 'borrow/unread'

  get 'welcome/index'

  resources :books

  root 'welcome#index'

  # Routes for user
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
