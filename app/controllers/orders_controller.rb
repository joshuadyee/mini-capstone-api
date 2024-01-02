class OrdersController < ApplicationController
  def create
    @order = Order.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total]
    )
    if @order.save
      render json: {hi: "Hello"}
    # else
    #   render json: {message: "Order not created successfully"}, status: :bad_create
    end
  end
end
