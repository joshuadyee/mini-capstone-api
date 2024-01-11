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
    # find all items in shopping cart		
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    # for each item		
    calculated_subtotal = 0
    @carted_products.each do |carted_product|
    #   find quantity	
    #   find price 	
    #     finding product id
    #     find price of that product
    #   multiply product and price for subtotal	
    # add all subtotals together		
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end
  # do math for tax + total		
    calculated_tax = 0.09 * calculated_subtotal
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    @order.save
    # find all items in shopping_cart
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    # change all the statuses to "purchased"
    @carted_products.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = @order.id
      carted_product.save
    end
    render :show
  end

  def destroy
    @carted_products = CartedProduct.find_by(id: params[:id])
    @carted_product.status = 'removed'
    @carted_product.save
    render json: {message: "item removed"}
  end
end
