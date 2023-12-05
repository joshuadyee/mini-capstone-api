Rails.application.routes.draw do
  get "/products", controller: "products", action: "index"
end
