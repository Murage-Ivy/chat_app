Rails.application.routes.draw do
  resources :users, only: [:create, :show, :index]
  resources :messages

  post "/login", to: "sessions#create"
  mount ActionCable.server => "./cable"
end
