Rails.application.routes.draw do
  root to: 'home#index'

  resources :shortest_routes, only: :index
end
