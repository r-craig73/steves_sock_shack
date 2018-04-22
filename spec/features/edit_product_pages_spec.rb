require 'rails_helper'

describe "editing a product process" do
  it "edits a product name" do
    product = Product.create(:name => 'Blue Sock', :cost => '4.99', :country_of_origin => 'China', :featured => false)
    review = Review.create(:author => 'Roxxxy Andrews', :content_body => 'It is a hug, Michael. I am hugging you. I like being with you. Not tricks, Michael, illusions', :rating => 3, :product_id => product.id)
    visit edit_product_url(product)
    fill_in 'Sock name', :with => 'Orange sock'
    # click_on 'Add Sock'
    expect(page).to have_content 'Your sock is updated'
  end


end
