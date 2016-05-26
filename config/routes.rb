Rails.application.routes.draw do
  resources :people
  resources :addresses

  root 'people#index'
end
