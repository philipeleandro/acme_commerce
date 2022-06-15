require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    context "when presence" do
      it 'true when has reference number a name' do
        client = Client.create(name: 'Lucas', email: 'example@example.com', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará')
        order = Order.new(reference_number: '123565568', status: 1, value: 2, payment_date: 10.days.from_now, client_id: client.id)
        
        expect(order.valid?).to eq true
      end

      it 'false when status is empty' do
        client = Client.create(name: 'Lucas', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará', email: 'example@example.com')
        order = Order.new(reference_number: '21313153', status: "", payment_date: 10.days.from_now, client_id: client.id)

        expect(order.valid?).to eq false
      end

      it 'true when has status a name' do
        client = Client.create(name: 'Lucas', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará', email: 'example@example.com')
        order = Order.new(reference_number: '123565568', status: 1, value: 2, payment_date: 10.days.from_now, client_id: client.id)
        
        expect(order.valid?).to eq true
      end
    end

    context 'when order belongs_to client' do
      it 'true when has client_id' do
        client = Client.create(name: 'Lucas', address: 'Rua da vitória', city: 'Juazeiro do Norte', state: 'Ceará', email: 'example@example.com')
        order = Order.new(reference_number: '123565568', status: 1, value: 2, payment_date: 10.days.from_now, client_id: client.id)
        
        expect(order.valid?).to eq true
      end

      it 'false when does not have client_id' do
        order = Order.new(reference_number: '123565568', status: 1, value: 2, payment_date: 10.days.from_now)
        
        expect(order.valid?).to eq false
      end
    end

    context 'generate code' do
      it 'when create a new order' do
        user = User.create(email: 'example@example.com', password: 'password')
        new_client = Client.create(name:'Pedro Gomes', state: 'Ceará', city: 'Fortaleza', address: 'Rua das lutas, 1000', email: 'example@example.com')
        new_category = Category.create(name: 'Phone')
        new_product = Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: new_category)
        new_order = Order.new(status: 1, value: 10, payment_date: Date.today, client: new_client)
        order_product = OrderProduct.create(order_id: new_order.id, product_id: new_product.id)

        new_order.save!
        result = new_order.reference_number

        expect(result).not_to be_empty
      end
    end

    context 'status' do
      it 'must be production when created' do
        user = User.create(email: 'example@example.com', password: 'password')
        new_client = Client.create(name:'Pedro Gomes', state: 'Ceará', city: 'Fortaleza', address: 'Rua das lutas, 1000', email: 'example@example.com')
        new_category = Category.create(name: 'Phone')
        new_product = Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: new_category)
        new_order = Order.new(payment_date: Date.today, value: 10, client: new_client)
        order_product = OrderProduct.create(order_id: new_order.id, product_id: new_product.id)

        expect(new_order.status).to eq('production')
      end
    end
  end
end

