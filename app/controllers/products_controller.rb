class ProductsController < ApplicationController
  skip_before_action :authenticate!
  # @url /products
  # @action GET
  def index
    if params[:search].present?
      @products = Product.where("(lower(products.name) like ? OR lower(products.description) like ?) OR price = ?", "%#{params[:search].to_s.downcase}", "%#{params[:search].to_s.downcase}", params[:search])
    else
      @products = Product.all
    end
    if @products
      render json: paginate_resource(@products.paginate(page: params[:page], per_page: params[:per_page])), status: 200
    else
      render json: "Products not found", status: 404
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    if @product
      render json: @prdouct, status: 200
    else
      render json: "Products not found", status: 404
    end
  end

end
