Rails.application.routes.draw do
  root to: 'home#index'

  post '/expense', to: 'expenses#create'
end
