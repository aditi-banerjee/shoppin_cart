Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  ##authenticate
  #
  post "/signup" => "registration#create", defaults: {format: :json}
  post "/sessions" => "sessions#create", defaults: {format: :json}
  delete "/sessions" => "sessions#destroy", defaults: {format: :json}

  #
  ##APIs
  #
  get "/products" => "products#index", defaults: {format: :json}
  get "/products/:id" => "products#show", defaults: {format: :json}
  post "/add_to_cart" => "carts#add_to_cart", defaults: {format: :json}
  get "/carts/:id" => "carts#show", defaults: {format: :json}
  post "/remove_product/:cart_id" => "carts#remove_product", defaults: {format: :json}
  post "/place_order/:cart_id" => "orders#create", defaults: {format: :json}
  resources :orders, except: [:create]
end
