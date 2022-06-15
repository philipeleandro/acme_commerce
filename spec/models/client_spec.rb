require 'rails_helper'

RSpec.describe Client, type: :model do
  describe '#valid?' do
    context "when presence" do
      it 'false when name is empty' do
        client = Client.new(name: '', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará', email: 'example@example.com')

        expect(client.valid?).to eq false
      end

      it 'true when has a name' do
        client = Client.new(name: 'Lucas', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará', email: 'example@example.com')

        expect(client.valid?).to eq true
      end

      it 'false when addres is empty' do
        client = Client.new(name: '', address: '', city: 'Juazeiro do Norte', state: 'Ceará', email: 'example@example.com')

        expect(client.valid?).to eq false
      end

      it 'true when has an address' do
        client = Client.new(name: 'Lucas', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará', email: 'example@example.com')

        expect(client.valid?).to eq true
      end

      it 'false when city is empty' do
      client = Client.new(name: 'Lucas', address: 'Rua da vitória', city: '', state: 'Ceará', email: 'example@example.com')

      expect(client.valid?).to eq false
      end

      it 'true when has a city' do
        client = Client.new(name: 'Lucas', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará', email: 'example@example.com')

        expect(client.valid?).to eq true
      end
    end
  end
end
