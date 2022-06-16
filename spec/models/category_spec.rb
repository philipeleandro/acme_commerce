# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#valid?' do
    context 'when presence' do
      it 'false when name is empty' do
        category = Category.new(name: '')

        expect(category.valid?).to eq false
      end

      it 'true when has a name' do
        category = Category.new(name: 'Case')

        expect(category.valid?).to eq true
      end
    end
  end
end
