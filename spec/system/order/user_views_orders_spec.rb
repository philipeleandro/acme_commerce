# frozen_string_literal: true

require 'rails_helper'

describe 'User views orders' do
  it 'and must log in' do
    visit orders_path

    expect(current_path).to eq new_user_session_path
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    new_client = Client.create(name: 'Pedro Gomes', state: 'Ceará', city: 'Fortaleza', address: 'Rua das lutas, 1000',
                               email: 'example@example.com')
    new_category = Category.create(name: 'Phone')
    new_product = Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com',
                                 category: new_category)
    new_order = Order.create(reference_number: '123456', status: 1, value: 10, payment_date: Date.today,
                             client: new_client)
    OrderProduct.create(order_id: new_order.id, product_id: new_product.id)

    login_as(user)
    visit root_path
    click_on 'Ordens'

    expect(page).to have_content "Ordem: #{new_order.reference_number}"
    expect(page).to have_content 'Valor: R$ 10.0'
  end

  it 'does not have registered order' do
    user = User.create(email: 'example@example.com', password: 'password')

    login_as(user)
    visit root_path
    click_on 'Ordens'

    expect(page).to have_content 'Não há ordem cadastrada'
  end
end
