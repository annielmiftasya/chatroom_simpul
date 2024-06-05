Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users

  root controller: :rooms, action: :index

  resources :rooms 
  resources :room_messages
end
