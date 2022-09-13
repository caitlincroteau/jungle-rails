require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.new(name: 'cacti')
    @category.save
  end
  
  describe 'Validation' do
    it 'should save product when all four required fields are set' do
      @product = Product.new(name: 'silver torch', price: 2780, quantity: 13, category: @category)
      expect(@product).to be_valid
      #dont need to do @product.save. It runs the validations and saves onto db
      #to be_valid runs the validations, which is all you need. Means 'is not valid to be saved onto the db.
    end

    it 'should provide an error message if name is not set' do
      @product = Product.new(name: nil, price: 2780, quantity: 13, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
      # expect(@product).to_not be_valid
    end

    it 'should provide an error message if price is not set' do
      @product = Product.new(name: 'silver torch', quantity: 13, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
      # expect(@product).to_not be_valid
    end

    it 'should provide an error message if quantity is not set' do
      @product = Product.new(name: 'silver torch', price: 2780, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
      # expect(@product).to_not be_valid
    end

    it 'should provide an error message if category is not set' do
      @product = Product.new(name: 'silver torch', price: 2780, quantity: nil, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
      # expect(@product).to_not be_valid
    end
  end

end
