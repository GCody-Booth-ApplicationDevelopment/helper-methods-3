Rails.application.routes.draw do
  resources :actors
  root "movies#index"
  
  resources :movies
  resources :directors
end
