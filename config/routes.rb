Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "welcome#index"
  
  get "/grow_zones", to: "grow_zones#index"
  get "/grow_zones/new", to: "grow_zones#new"
  post "/grow_zones", to: "grow_zones#create"
  get "/grow_zones/:id", to: "grow_zones#show"
  get "/grow_zones/:grow_zone_id/plants", to: "grow_zone_plants#index"
  get "/grow_zones/new", to: "grow_zones#new"
  get "/grow_zones/:id/edit", to: "grow_zones#edit"
  patch "/grow_zones/:id", to: "grow_zones#update"
  get "/grow_zones/:grow_zone_id/plants/new", to: "grow_zone_plants#new"
  post "/grow_zones/:grow_zone_id/plants", to: "grow_zone_plants#create"

  get "/plants", to: "plants#index"
  get "/plants/:id", to: "plants#show"
  
  
end
