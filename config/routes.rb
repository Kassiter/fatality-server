Rails.application.routes.draw do
  resources :personal_items
  devise_for :users
  resources :personal_features
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :privilieges_features
  resources :privilieges
  get '/privilieges_all', to: "privilieges#get_privilieges"
  post '/personal_items/request_item', to: "personal_items#request_item"
  get '/auth/steam/callback', to: "users#handle_steam_login"
  post '/auth/steam/callback', to: "users#handle_steam_login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
