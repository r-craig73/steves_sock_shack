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
    render :display
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        flash[:notice] = "Your sock is updated"
        redirect_to products_path
      else
        render :edit
      end
  end

private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin, :featured)
  end
end
