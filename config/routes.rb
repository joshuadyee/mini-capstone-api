Rails.application.routes.draw do
  get "/products", controller: "products", action: "index"
  get "/first_product" => "products#show"
end
