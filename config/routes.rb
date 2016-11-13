Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users

  resources :chat_rooms



  root 'chat_rooms#index'

end
