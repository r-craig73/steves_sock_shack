require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Add a New Sock'
    fill_in('Sock name', :with => 'BLUE sock')
    #fill_in 'Cost', :with => '4.25'
    fill_in 'Made in which country', :with => 'Japan'
    # choose('Not Featured')
    click_on 'Add Sock'
    expect(page).to have_content 'Your sock is added to the list'
  end

  it "gives error when no name is entered" do
    visit products_path
    #click_link 'Add a New Sock'
    fill_in 'Cost', :with => '4.25'
    click_on 'Add Sock'
    expect(page).to have_content 'errors'
  end

  it "gives error when no cost is entered" do
    visit products_path
    #click_link 'Add a New Sock'
    fill_in('Sock name', :with => 'BLUE sock')
    click_on 'Add Sock'
    expect(page).to have_content 'errors'
  end

end
