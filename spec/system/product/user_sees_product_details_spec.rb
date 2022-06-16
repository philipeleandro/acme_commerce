# frozen_string_literal: true

require 'rails_helper'

describe 'User sees a product details' do
  it 'and must log in' do
    new_category = Category.create(name: 'Phone')
    product = Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com',
                             category: new_category)

    visit product_path(product.id)

    expect(current_path).to eq new_user_session_path
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    new_category = Category.create(name: 'Phone')
    Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: new_category)

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ver Produtos'
    click_on 'Case'

    expect(page).to have_content 'Nome: Case'
    expect(page).to have_content 'Categoria: Phone'
    expect(page).to have_content 'Valor: R$ 10.0'
    expect(page).to have_content 'Valor Base: R$ 7.0'
    expect(page).to have_content 'Imagem: http://www.example.com'
  end

  it 'return when clicks on  Voltar' do
    user = User.create(email: 'example@example.com', password: 'password')
    new_category = Category.create(name: 'Phone')
    Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: new_category)

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ver Produtos'
    click_on 'Case'
    click_on 'Voltar'

    expect(current_path).to eq products_path
  end
end
