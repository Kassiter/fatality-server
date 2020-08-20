Rails.application.routes.draw do
  resources :manage_commands
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
  get '/users/admins', to: "users#get_administration"
  get '/manage_command_categories/mc_categories', to: "manage_command_categories#mc_categories"
  get 'users/refresh', to: "users#refresh_user_data"
  get 'users/strikes', to: "users#strikes"
  post 'contests/take_part', to: "contests#take_part"
  post 'moder_contest/take_part', to: "moder_contests#take_part"
  get 'moders/m_points', to: "users#get_m_points"
  post 'refund/take_part', to: "refunds#apply_form"
  get  'refund/participating', to: "refunds#participating"
  post  'logs/pull', to: "logs#pull_log!", format: :json
  get  'logs/show_log', to: "logs#show_log"
  post  'logs/report', to: "logs#report_rows"
  post '/personal_items/request_item', to: "personal_items#request_item"
  post '/personal_items/validate_random_key', to: "personal_items#validate_random_key"
  post '/personal_items/request_random_item', to: "personal_items#request_random_item"
  get '/auth/steam/callback', to: "users#handle_steam_login"
  post '/auth/steam/callback', to: "users#handle_steam_login"

  get '/prime_moder_tasks/task', to: "prime_moder_tasks#get_task"
  post '/prime_moder_tasks/submit_report', to: "prime_moder_tasks#submit_report"
  post '/prime_moder_tasks/upload_skin', to: "prime_moder_tasks#upload_skin"
  post '/prime_moder_tasks/upload_map', to: "prime_moder_tasks#upload_map"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
