class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :cost, :presence => true

  scope :usa_product, -> { where("country_of_origin =?", "United States of America")}
  scope :three_latest_product, -> { order(created_at: :desc).limit(3)}

  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(12)
  )}


end
