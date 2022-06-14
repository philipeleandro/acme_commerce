require 'rails_helper'

describe 'User register a new order' do
  it 'and must log in' do
    visit new_client_path

    expect(current_path).to eq new_user_session_path
  end

  it 'in root_path' do
    user = User.create(email: 'example@example.com', password: 'password')

    login_as(user)
    visit root_path
    click_on 'Ordens'
    click_on 'Cadastrar Ordem'

    expect(page).to have_field 'Dia de Pagamento'
    expect(page).to have_field 'Produto'
  end


  # it 'with success' do
  # user = User.create(email: 'example@example.com', password: 'password')
  # new_client = Client.create(name:'Pedro Gomes', state: 'Ceará', city: 'Fortaleza', address: 'Rua das lutas, 1000')
  # new_category = Category.create(name: 'Phone')
  # new_product = Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: new_category)
  # new_order = Order.create(reference_number: '1236545', status: 1, payment_date: Date.today, client: new_client)
  # order_product = OrderProduct.create(order: new_order, client: new_client)

  # login_as(user)
  # visit root_path
  # click_on 'Ordens'
  # click_on 'Cadastrar nova ordem'
  # fill_in 'Data de Pagamento', with: Time.from_now
  # fill_in 'Produto', with: 'Case'
  # click_on 'Cadastrar'
  
  # expect(page).to have_content 'Ordem: 1236545'
  # expect(page).to have_content 'Valor: R$ 10.00'
  # expect(page).to have_content "Data de Pagamento: #{I18n.localize(Date.today)}"
  # end
end