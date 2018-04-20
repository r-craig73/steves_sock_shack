class ReviewsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @reviews = Review.all
    render :index
  end

  



end
