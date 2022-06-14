require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    context "when presence" do
      it 'false when reference number is empty' do
        client = Client.create(name: 'Lucas', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará')
        order = Order.new(reference_number: '', status: 1, payment_date: 10.days.from_now, client_id: client.id)

        expect(order.valid?).to eq false
      end

      it 'true when has reference number a name' do
        client = Client.create(name: 'Lucas', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará')
        order = Order.new(reference_number: '123565568', status: 1, value: 2, payment_date: 10.days.from_now, client_id: client.id)
        
        expect(order.valid?).to eq true
      end

      it 'false when status is empty' do
        client = Client.create(name: 'Lucas', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará')
        order = Order.new(reference_number: '21313153', status: "", payment_date: 10.days.from_now, client_id: client.id)

        expect(order.valid?).to eq false
      end

      it 'true when has status a name' do
        client = Client.create(name: 'Lucas', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará')
        order = Order.new(reference_number: '123565568', status: 1, value: 2, payment_date: 10.days.from_now, client_id: client.id)
        
        expect(order.valid?).to eq true
      end
    end

    context 'when order belongs_to client' do
      it 'true when has client_id' do
        client = Client.create(name: 'Lucas', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará')
        order = Order.new(reference_number: '123565568', status: 1, value: 2, payment_date: 10.days.from_now, client_id: client.id)
        
        expect(order.valid?).to eq true
      end

      it 'false when does not have client_id' do
        order = Order.new(reference_number: '123565568', status: 1, value: 2, payment_date: 10.days.from_now)
        
        expect(order.valid?).to eq false
      end
    end
  end
end

