Rails.application.routes.draw do
  resources :instructors, only: [:index, :update, :create]
  resources :students, only: [:index, :update, :create]

end
