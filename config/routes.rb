Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/twitter', as: :login
  get '/auth/twitter/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: :logout

  post '/tweets/new', to: 'tweets#create', as: :new_tweet
  post '/tweets/favorite', to: 'tweets#favorite', as: :favorite_tweet
end
