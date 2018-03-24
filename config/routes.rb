Rails.application.routes.draw do
  resources :messages
  root 'messages#index'

  mount ActionCable.server, at: '/cable'
end
