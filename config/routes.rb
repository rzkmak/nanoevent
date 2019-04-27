Rails.application.routes.draw do
  post '/location/create', to: 'location#create', action: 'create'
end
