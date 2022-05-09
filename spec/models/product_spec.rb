require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  before(:each) do
    @category = Category.new
    @product = Product.new
    @category.name = 'test'
    @product.name = 'panda'
    @product.price_cents = 111
    @product.quantity = 1
    @product.category = @category
    # @product.category_id = 1
  end
context 'all fields have values' do
  it 'returns true' do
  expect(@product.valid?).to be true
end
end
    context 'add product with no name ' do
      it 'throws error for no name' do
        @product.name = nil
        @product.save
        expect(@product.errors.full_messages).to include('Name can\'t be blank')
      end
    end
    context 'add product with no price' do
      it 'throws error for no price' do
        @product.price_cents = nil
        @product.save
        expect(@product.errors.full_messages).to include('Price can\'t be blank')
      end
    end
    context 'add product with no quantity' do
      it 'throws error for no quantity' do
        @product.quantity = nil
        @product.save
        expect(@product.errors.full_messages).to include('Quantity can\'t be blank')
      end
    end
    context 'add product with no category' do
      it 'throws error for no category' do
        @product.category = nil
        @product.save
        expect(@product.errors.full_messages).to include('Category can\'t be blank')
      end
    end
  end
end
