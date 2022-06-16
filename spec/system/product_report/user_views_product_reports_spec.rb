require 'rails_helper'

describe 'User view Report' do
  it 'and must log in' do
    visit product_report_path

    expect(current_path).to eq new_user_session_path
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    new_client = Client.create(name:'Pedro Gomes', state: 'Ceará', city: 'Fortaleza', address: 'Rua das lutas, 1000', email: 'example@example.com')
    new_category = Category.create(name: 'Phone')
    new_product = Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: new_category)
    new_product_two = Product.create(name: 'Phone', value: 10, base_value: 7, image_url: 'http://www.example.com', category: new_category)
    new_order = Order.create(reference_number: '123456', status: 1, value: 10, payment_date: Date.today, client: new_client)
    order_product = OrderProduct.create(order_id: new_order.id, product_id: new_product.id)
    order_product = OrderProduct.create(order_id: new_order.id, product_id: new_product.id)
    order_product = OrderProduct.create(order_id: new_order.id, product_id: new_product_two.id)

    login_as(user)
    visit root_path
    click_on 'Relatório'

    expect(page).to have_content 'Case'
    expect(page).to have_content '2'
    expect(page).to have_content 'Phone'
    expect(page).to have_content '1'
  end
end