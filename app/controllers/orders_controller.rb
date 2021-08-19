class OrdersController < ApplicationController
  before_action :authenticate!

  def index
    @orders = @current_user.orders
    if @orders
      render json: paginate_resource(@orders.paginate(page: params[:page], per_page: params[:per_page])), status: 200
    else
      render json: "Orders not found", status: 404
    end
  end

  def create
    @cart = Cart.find_by(id: params[:cart_id])
    @current_user.update(place_orders_params)
    if @cart.present? && !@current_user.delivery_address.nil?
      @order = @cart.build_order(user_id: @current_user.id)
      if @order.save
        @cart.update(user_id: @user_id, active: false)
        OrderPlacedMailer.order_details(@order).deliver_now
        render json: @order, status: 200
      else
        render json: {errors: @order.errors.full_messages}, status: 400
      end
    else
      render json: {errors: "Cart not found or the details to place order and not given"}, status: 404
    end
  end

  def show
    @order = @current_user.orders.find_by(id: params[:id])
    if @order
      render json: @order, status: 200
    else
      render json: "Order not found", status: 404
    end
  end

  private

  def place_orders_params
    params.permit(:name, :email, :delivery_address, :phone_number)
  end
end
