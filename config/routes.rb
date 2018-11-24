Rails.application.routes.draw do
  root to: 'home#index'

  post '/expense', to: 'expenses#create'

  namespace :api do
    resources :expenses, only: %i[index create]
  end
end
