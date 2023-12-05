class ProductsController < ApplicationController

  def info 
    @products = Product.first
    render template: "products/index"
  end

end
