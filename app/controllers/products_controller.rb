class ProductsController < ApplicationController

  def index
    @products = Product.all
    @usaproducts = Product.usa_product
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Your sock is added to the list"
      redirect_to products_path
    else
      render :new
    end
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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
      flash[:notice] = "The sock is removed"
      redirect_to products_path
    end

private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin, :featured)
  end
end
