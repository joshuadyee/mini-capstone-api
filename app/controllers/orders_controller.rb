class OrdersController < ApplicationController
  def index
    @order = Order.all
    render :index
  end
  
  def show
    @order = Order.find_by(id: params[:id])
    # render template: "orders/show"
    render :show
  end
  
  def create
    p "current_user"
    p current_user.id
    p "current_user"
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
