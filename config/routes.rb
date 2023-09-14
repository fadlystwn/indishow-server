Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/artists/:id/albums', to: 'albums#show', as: 'artist_albums'
  # root "articles#index"

  resources :artists do
    resources :albums, only: [ :new, :create]
  end

  root to: 'artists#index'
end
