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


  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG 
    save_screenshot('home_page.png')

    #VERIFY
    expect(page).to have_css 'article.product', count:10
  end

  scenario "They click to see details of specific product " do
    # ACT
    visit root_path

    # DEBUG 
    save_screenshot('home_page_pt1.png')
    first('.actions').click_link('Details')
    sleep 10
    save_screenshot('home_page_pt2.png')
    #VERIFY
    expect(page).to have_css 'article.product-detail'
  end

end