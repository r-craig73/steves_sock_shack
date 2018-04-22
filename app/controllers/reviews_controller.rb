class ReviewsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @reviews = Review.all
    render :index
  end

  def new
    @product = Product.find(params[:product_id])
    review_id = @product.review_id
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    review_id = @product.review_id

    @review = Review.new(review_params)
    @review.product_id = @product.id
    if @review.save
      flash[:notice] = "Thank you for your review. Your review is added to the product."
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

private
  def review_params
    params.require(:review).permit(:content_body, :rating)
  end



end
