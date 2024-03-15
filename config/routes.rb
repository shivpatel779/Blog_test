Rails.application.routes.draw do
  root "users#index"
  post '/register', to: 'users#create'
  post '/login', to: 'users#login'
  post '/users', to: 'users#create_user'
  post '/user_login', to: 'users#user_login'
  delete '/logout_user', to: 'users#logout_user'
  delete '/logout', to: 'users#logout'
  get '/register', to: 'users#new'
  get '/login_new', to: 'users#login_new'
  post '/login' , to: 'users#login'
  # get '/new/:user_id', to: 'posts#new'
  get '/new/:user_id', to: 'posts#new', as: 'new_post'
  post '/posts', to: 'posts#create'
  delete '/post/:id', to: 'posts#destoy'
  get '/show_all_post', to: 'posts#show_all_post'
  resources :posts
end