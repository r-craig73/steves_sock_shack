class Review < ActiveRecord::Base
  belongs_to :product

  validates :author, :presence => true
  validates_length_of :content_body, minimum: 50, maximum: 250, too_short: 'is too short (minimum is 50 characters)', too_long: 'is too long (maximum is 250 characters)'
  validates :rating, :presence => true
end
