class Review < ActiveRecord::Base
  validates :author, :presence => true
  validates :content_body, :presence => true

end
