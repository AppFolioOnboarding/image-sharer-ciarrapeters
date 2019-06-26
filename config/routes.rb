Rails.application.routes.draw do
  resources :images
  root 'home#index'
  get 'tags/:tag', to: 'home#index', as: :tag
end
