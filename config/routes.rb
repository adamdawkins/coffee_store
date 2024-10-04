# config/routes.rb
Rails.application.routes.draw do
  resources :orders, only: [:create]
end
