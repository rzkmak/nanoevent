Rails.application.routes.draw do
  post '/location/create', to: 'location#create', action: 'create'
  get '/location/index', to: 'location#index', action: 'index'
end
