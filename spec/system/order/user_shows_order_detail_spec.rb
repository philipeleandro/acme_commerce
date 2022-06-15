require 'rails_helper'

describe 'User views orders details' do
  it 'and must log in' do
    user = User.create(email: 'example@example.com', password: 'password')
    new_client = Client.create(name:'Pedro Gomes', state: 'Ceará', city: 'Fortaleza', address: 'Rua das lutas, 1000', email: 'example@example.com')
    new_category = Category.create(name: 'Phone')
    new_product = Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: new_category)
    new_order = Order.create(reference_number: '123456', status: 1, value: 10, payment_date: Date.today, client: new_client)
    order_product = OrderProduct.create(order_id: new_order.id, product_id: new_product.id)

    visit order_path(new_order.id)

    expect(current_path).to eq new_user_session_path
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    new_client = Client.create(name:'Pedro Gomes', state: 'Ceará', city: 'Fortaleza', address: 'Rua das lutas, 1000', email: 'example@example.com')
    new_category = Category.create(name: 'Phone')
    new_product = Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: new_category)
    new_order = Order.create(reference_number: '123456', status: 1, value: 10, payment_date: Date.today, client: new_client)
    order_product = OrderProduct.create(order_id: new_order.id, product_id: new_product.id)

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ordens'
    click_on "#{new_order.reference_number}"

    expect(page).to have_content "Número de Referencia: #{new_order.reference_number}" 
    expect(page).to have_content "Valor: #{new_order.value}"
    expect(page).to have_content "Status: #{new_order.status}" 
    expect(page).to have_content "Cliente: Pedro Gomes" 
    expect(page).to have_content "Case - R$ 10.0"
  end

  it 'return when clicks on Voltar' do
    user = User.create(email: 'example@example.com', password: 'password')
    new_client = Client.create(name:'Pedro Gomes', state: 'Ceará', city: 'Fortaleza', address: 'Rua das lutas, 1000', email: 'example@example.com')
    new_category = Category.create(name: 'Phone')
    new_product = Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: new_category)
    new_order = Order.create(reference_number: '123456', status: 1, value: 10, payment_date: Date.today, client: new_client)
    order_product = OrderProduct.create(order_id: new_order.id, product_id: new_product.id)

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ordens'
    click_on "#{new_order.reference_number}"
    click_on 'Voltar'

    expect(current_path).to eq orders_path
  end
end