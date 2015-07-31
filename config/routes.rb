Rails.application.routes.draw do
  resources :user_preferences
  resource :calendar, only: [] do
      get :week
      get :day
      post :event
  end
  resources :recipes


end
