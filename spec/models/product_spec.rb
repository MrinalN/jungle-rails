require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save successfully if all fields are present' do
      @category = Category.create
      @product = Product.create(name: 'Cheezy Chair', price: 400, quantity: 4, category: @category)
      expect(@product).to be_valid
    end

    it 'should display error message when :name is nil' do
      @category = Category.create(name:'Edible furniture')
      @product = Product.create(name: nil, price: 400, quantity: 4, category: @category)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should display error message when :price is nil' do
      @category = Category.create(name:'Edible furniture')
      @product = Product.create(name: 'Cheezy Chair', price: nil, quantity: 4, category: @category)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should display error message when :quantity is nil' do
      @category = Category.create(name:'Edible furniture')
      @product = Product.create(name: 'Cheezy Chair', price: 400, quantity: nil, category: @category)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should display error message when :category is nil' do
      @product = Product.create(name: nil, price: 400, quantity: 4, category: nil)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    
  end
end
