class CartedProductsController < ApplicationController

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render :index
  end
  
  def create 
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: nil,
      status: params[:stat]
    )
    if @carted_product.save
      render :show
    else
      render json: {errors: @carted_product.errors.full_messages}, status: :unprocessable_entity
    end 
  end
end
