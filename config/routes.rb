Rails.application.routes.draw do
  resources :refunds
  resources :contests
  resources :moder_contests
  resources :previlegies_keys
  resources :personal_items
  devise_for :users
  resources :personal_features 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :privilieges_features
  resources :privilieges
  get '/privilieges_all', to: "privilieges#get_privilieges"
  get '/contest_keys/index_keys', to: "contest_keys#index_keys"
  post '/contest_keys/submit_report', to: "contest_keys#submit_report"
  post '/contest_keys/generate_keys', to: "contest_keys#generate_keys"
  get '/users/vip_data', to: "vip_users#show_vip"
  get 'users/refresh', to: "users#refresh_user_data"
  post 'contests/take_part', to: "contests#take_part"
  post 'moder_contest/take_part', to: "moder_contests#take_part"
  post 'refund/take_part', to: "refunds#apply_form"
  get  'refund/participating', to: "refunds#participating"
  post '/personal_items/request_item', to: "personal_items#request_item"
  get '/auth/steam/callback', to: "users#handle_steam_login"
  post '/auth/steam/callback', to: "users#handle_steam_login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
