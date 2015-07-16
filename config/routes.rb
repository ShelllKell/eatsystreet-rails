Rails.application.routes.draw do
  resources :preferences, only: [:index]
end
