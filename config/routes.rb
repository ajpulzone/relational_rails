Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "welcome#index"
  
  get "/grow_zones", to: "grow_zones#index"
  get "/grow_zones/new", to: "grow_zones#new"
  post "/grow_zones", to: "grow_zones#create"
  get "/grow_zones/:id", to: "grow_zones#show"
end
