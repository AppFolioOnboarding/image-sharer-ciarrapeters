Rails.application.routes.draw do
  resources :images
  root 'home#index'
  get 'tags/:tag', to: 'home#index', as: :tag

  resources :feedbacks, only: [:new]

  namespace :api do
    resource :feedbacks, only: [:create]
  end
end
