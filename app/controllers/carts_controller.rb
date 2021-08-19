class CartsController < ApplicationController
  before_action :authenticate!
  # @url /add_to_cart
  # @action Post
  def add_to_cart
    @cart = @current_user.carts.find_by(active: true)
    @cart_item = @cart.cart_items.create(product_id: params[:product_id], quantity: params[:quantity])
    @cart_item.set_total_price
    @cart.set_cart_total
    if @cart
      render json: @cart, status: 200
    else
      render json: { errors: @cart.errors.full_messages }, status: 404
    end
  end

  #@url/carts
  #@action GET
  def index
    @carts = @current_user.carts
    if @carts
      render json: paginate_resource(@carts.paginate(page: params[:page], per_page: params[:per_page])), status: 200
    else
      render json: "Cart not found", status: 404
    end
  end

  # @url /cart
  # @action GET
  def show
    @cart = @current_user.carts.find_by(id: params[:id])
    if @cart
      render json: @cart, status: 200
    else
      render json: "Cart not found", status: 404
    end
  end

  def remove_product
    if params[:cart_id] && params[:product_id]
      @cart = @current_user.carts.find_by(id: params[:cart_id])
      @cart.cart_items.where(product_id: params[:product_id]).destroy_all
      @cart.set_cart_total
      render json: @cart, status: 200
    else
      render json: "Please pass all the params", status: 404
    end
  end
end
