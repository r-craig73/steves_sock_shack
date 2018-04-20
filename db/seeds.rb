
Product.destroy_all
Review.destroy_all

20.times do |i|
  @name = Faker::Color.color_name
  @cost = Faker::Number.decimal(2, 2)
  @country_of_origin = Faker::LordOfTheRings.location
  @featured = Faker::Boolean.boolean(0.2)
  @created_at = Faker::Time.backward(14, :all)
  Product.create!(name: @name, cost: @cost, country_of_origin: @country_of_origin, featured: @featured, created_at: @created_at, review_id: @review_id)
end

p "Created #{Product.count} socks-products"
p "Created #{Review.count} reviews"
