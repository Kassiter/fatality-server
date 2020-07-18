Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :privilieges_features
  resources :privilieges
  get '/privilieges_all', to: "privilieges#get_privilieges"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
