Rails.application.routes.draw do
  root 'game_dates#select'
  resources :games
  resources :game_dates do
    get 'select', on: :collection
  end

  post 'game_dates/show', to: 'game_dates#show'
end
