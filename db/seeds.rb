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
  if i == 0 # total 1 review
    @author = Faker::RuPaul.queen
    @rating = Faker::Number.between(1, 5)
    random_number = Faker::Number.between(50, 250)
    @created_at = Faker::Time.backward(3, :all)
    @content_body = arrested_development_quotes[0..random_number]
    Review.create!(product_id: @product_id, author: @author, rating: @rating, content_body: @content_body, created_at: @created_at)
    @review_id = Review.last.id
  elsif i.between?(1,4)  # total 8 reviews (4 products x 2 reviews)
    2.times {
      @rating = Faker::Number.between(1, 5)
      @review_id = Review.last.id
      random_number = Faker::Number.between(50, 250)
      @created_at = Faker::Time.backward(3, :all)
      @content_body = arrested_development_quotes[0..random_number]
      Review.create!(product_id: @product_id, author: @author, rating: @rating, content_body: @content_body, created_at: @created_at)
      @review_id = Review.last.id
    }
  elsif i.between?(5,12) # total 32 reviews (8 products x 4 reviews)
    4.times {
      @rating = Faker::Number.between(1, 5)
      @review_id = Review.last.id
      random_number = Faker::Number.between(50, 250)
      @created_at = Faker::Time.backward(3, :all)
      @content_body = arrested_development_quotes[0..random_number]
      Review.create!(product_id: @product_id, author: @author, rating: @rating, content_body: @content_body, created_at: @created_at)
      @review_id = Review.last.id
    }
  else
  end
end


p "Created #{Product.count} socks-products"
p "Created #{Review.count} reviews"
