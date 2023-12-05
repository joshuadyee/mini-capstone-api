class ProductsController < ApplicationController

  def index 
    @products = Product.all
    render template: "products/index"
  end

  def show
    render json: {hi: "hello"}
    # render template: "products/show"
  end
end
