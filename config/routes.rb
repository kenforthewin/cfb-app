Rails.application.routes.draw do
  root 'games#show'
  resources :games
end
