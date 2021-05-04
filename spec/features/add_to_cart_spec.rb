require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


  scenario "Add to cart button increases items in cart by one" do
    # ACT
    visit root_path

  

   # DEBUG 
    save_screenshot('home_page_cart_pt1.png')
    first('.actions').click_button('Add')
    sleep 10
    save_screenshot('home_page_cart_pt2.png')
    
    #VERIFY
    expect(page).to have_content('My Cart (1)')
  end

end