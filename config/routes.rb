Rails.application.routes.draw do
  post '/location/create', to: 'location#create', action: 'create'
  get '/location/index', to: 'location#index', action: 'index'

  post '/event/create', to: 'event#create', action: 'create'
  get '/event/get_info', to: 'event#index', action: 'index'

  post '/event/ticket/create', to: 'event#create_ticket', action: 'create_ticket'

  post '/transaction/purchase', to: 'purchase#create', action: 'create'
end
