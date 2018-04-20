class ProductsController < ApplicationController

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end
end
