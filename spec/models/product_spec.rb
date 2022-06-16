# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#valid?' do
    context 'when presence' do
      it 'false when name is empty' do
        new_category = Category.create(name: 'New product')
        product = Product.new(name: '', value: 12.5, base_value: 10, image_url: 'http://www.example.com',
                              category: new_category)

        expect(product.valid?).to eq false
      end

      it 'true when has name field' do
        new_category = Category.create(name: 'New product')
        product = Product.new(name: 'Case', value: 12.5, base_value: 10, image_url: 'http://www.example.com',
                              category: new_category)

        expect(product.valid?).to eq true
      end

      it 'false when value is empty' do
        new_category = Category.create(name: 'New product')
        product = Product.new(name: 'Bag', value: '', base_value: 10, image_url: 'http://www.example.com',
                              category: new_category)

        expect(product.valid?).to eq false
      end

      it 'true when has value field' do
        new_category = Category.create(name: 'New product')
        product = Product.new(name: 'Bag', value: 12.5, base_value: 10, image_url: 'http://www.example.com',
                              category: new_category)

        expect(product.valid?).to eq true
      end

      it 'false when base value is empty' do
        new_category = Category.create(name: 'New product')
        product = Product.new(name: 'New Case', value: 12.5, base_value: '', image_url: 'http://www.example.com',
                              category: new_category)

        expect(product.valid?).to eq false
      end

      it 'true when has base value field' do
        new_category = Category.create(name: 'New product')
        product = Product.new(name: 'New Case', value: 12.5, base_value: 10, image_url: 'http://www.example.com',
                              category: new_category)

        expect(product.valid?).to eq true
      end

      it 'false when image_url is empty' do
        new_category = Category.create(name: 'New product')
        product = Product.new(name: 'New Case', value: 12.5, base_value: 10, image_url: '', category: new_category)

        expect(product.valid?).to eq false
      end

      it 'true when has image_url field' do
        new_category = Category.create(name: 'New product')
        product = Product.new(name: 'New Case', value: 12.5, base_value: 10, image_url: 'http://www.example.com',
                              category: new_category)

        expect(product.valid?).to eq true
      end
    end

    context 'when belongs to' do
      it 'must have a category' do
        product = Product.new(name: 'Case', value: 12.5, base_value: 10, image_url: 'http://www.example.com')

        expect(product.valid?).to eq false
      end
    end
  end
end
