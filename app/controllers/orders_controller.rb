class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    # @order = Order.all
    @orders = current_user.orders
    render :index
  end
  
  def show
    @order = Order.find_by(id: params[:id])
    if current_user.id == @order.user_id
      render :show
    else
      render json: {message: "You cannot access these orders"}
    end
  end
  
  def create
    p "current_user"
    p current_user.id
    p "current_user"
    #subtotal = quantity * price
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = 0.09 * calculated_subtotal
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    if @order.save
      render :show
    else
      render json: {errors: @order.errors.full_messages}, status: :bad_create
    end
  end
end
