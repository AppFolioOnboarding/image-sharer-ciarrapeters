Rails.application.routes.draw do
  resources :images
  root 'home#index'
end
