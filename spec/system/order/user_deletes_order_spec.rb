require 'rails_helper'

describe 'User deletes order' do
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
    click_on 'Deletar'

    expect(page).to have_content 'Ordem deletada com sucesso'
    expect(page).not_to have_content "Valor: #{new_order.value}"
    expect(page).not_to have_content "Número de Referencia: #{new_order.reference_number}" 
  end
end