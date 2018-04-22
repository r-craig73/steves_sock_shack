Product.destroy_all
Review.destroy_all

country_list = ["China", "Japan", "China", "China", "United States of America", "China", "China", "United States of America", "China", "China", "China", "Japan", "China", "China", "United States of America", "China", "China", "United States of America", "China", "China", "China", "Japan", "China", "China", "United States of America", "China", "China", "United States of America", "China", "China", "China", "Japan", "China", "China", "United States of America", "China", "China", "United States of America", "China", "China","China", "Japan", "China", "China", "United States of America", "China", "China", "United States of America", "China", "China"]

arrested_development_quotes = "It's a hug, Michael. I'm hugging you. No! I was ashamed to be SEEN with you. I like being with you. Not tricks, Michael, illusions. There's so many poorly chosen words in that sentence. Did you enjoy your meal, Mom? You drank it fast enough. I'm a monster.  I hear the jury's still out on science."

50.times do |i|
  @name = Faker::Color.color_name.capitalize + " sock"
  @cost = Faker::Number.decimal(1, 2)
  country_list[i]
  @featured = Faker::Boolean.boolean(0.2)
  @created_at = Faker::Time.backward(14, :all)
  Product.create!(name: @name, cost: @cost, country_of_origin: country_list[i], featured: @featured, created_at: @created_at)
  @product_id = Product.last.id
  # 50.times do |i|
  #   @rating = Faker::Number.between(1, 5)
  #   random_number = Faker::Number.between(50, 250)
  #   @content_body = arrested_development_quotes[0..random_number]
  #   Review.create!(author: Faker::RuPaul.queen, rating: @rating, content_body: @content_body, created_at: @created_at)
  #   @review_id = Review.last.id
  # end
end


p "Created #{Product.count} socks-products"
p "Created #{Review.count} reviews"
