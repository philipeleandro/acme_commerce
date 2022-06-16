# frozen_string_literal: true

require 'rails_helper'

describe 'User views all products' do
  it 'in root_path' do
    user = User.create(email: 'example@example.com', password: 'password')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ver Produtos'

    expect(page).to have_content 'Todos os Produtos'
    expect(current_path).to eq products_path
  end

  it 'and must log in' do
    visit products_path

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

    expect(page).to have_content 'Case'
    expect(page).to have_content '10'
    expect(page).to have_content 'Phone'
  end

  it 'does not have registered product' do
    user = User.create(email: 'example@example.com', password: 'password')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ver Produtos'

    expect(page).to have_content 'Não há produto cadastrado'
  end
end
