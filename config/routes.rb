Rails.application.routes.draw do
  post '/location/create', to: 'location#create', action: 'create'
  get '/location/index', to: 'location#index', action: 'index'

  post '/event/create', to: 'event#create', action: 'create'

  post '/event/ticket/create', to: 'event#create_ticket', action: 'create_ticket'
end
