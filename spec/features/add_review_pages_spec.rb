require 'rails_helper'

describe "the review process" do
  it "adds a new review" do
    product = Product.create(:name => 'Blue Sock', :cost => '4.99', :country_of_origin => 'China', :featured => false)
    review = Review.create(:author => 'Roxxxy Andrews', :content_body => 'It is a hug, Michael. I am hugging you. I like being with you. Not tricks, Michael, illusions', :rating => 3, :product_id => product.id)
    visit product_url(product)
    click_on 'Add a Review'
    fill_in 'Author', :with => 'Bob K.'
    # fill_in 'Review', :with => 'xxxxxxxxxxxx xxxxxxxxxxxx xxxxxxxxxxxx xxxxxxxxxxxx xxxxxxxxxxxx'
    # select 4, from: 'Rating'
    click_on 'Add Review'
    expect(page).to have_content 'Thank you for your review.'
  end

  # it "reports an error when name is empty" do
  #   visit new_product_review_path
  #   fill_in 'Review', :with => 'xxxxxxxxxxxx xxxxxxxxxxxx xxxxxxxxxxxx xxxxxxxxxxxx xxxxxxxxxxxx'
  #   select('2', from: 'Rating')
  #   click_link 'Add Review'
  #   expect(page).to have_content 'errors'
  # end

end
