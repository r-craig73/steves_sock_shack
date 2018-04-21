class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :cost, :presence => true

  scope :usa_product, -> { where("country_of_origin =?", "United States of America")}

end
