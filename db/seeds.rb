
Product.destroy_all
Review.destroy_all
country_list = ["China", "Japan", "China", "China", "United States of America", "China", "China", "United States of America", "China", "China", "China", "Japan", "China", "China", "United States of America", "China", "China", "United States of America", "China", "China", "China", "Japan", "China", "China", "United States of America", "China", "China", "United States of America", "China", "China", "China", "Japan", "China", "China", "United States of America", "China", "China", "United States of America", "China", "China","China", "Japan", "China", "China", "United States of America", "China", "China", "United States of America", "China", "China"]

50.times do |i|
  @name = Faker::Color.color_name
  @cost = Faker::Number.decimal(1, 2)
  country_list[i]
  @featured = Faker::Boolean.boolean(0.2)
  @created_at = Faker::Time.backward(14, :all)
  Product.create!(name: @name, cost: @cost, country_of_origin: country_list[i], featured: @featured, created_at: @created_at, review_id: @review_id)
end



p "Created #{Product.count} socks-products"
p "Created #{Review.count} reviews"
