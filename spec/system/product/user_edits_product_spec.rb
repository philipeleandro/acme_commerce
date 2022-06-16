# frozen_string_literal: true

require 'rails_helper'

describe 'User edits a product' do
  it 'in product details' do
    user = User.create(email: 'example@example.com', password: 'password')
    new_category = Category.create(name: 'Phone')
    Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com',
                   category: new_category)

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ver Produto'
    click_on 'Editar'

    expect(page).to have_field('Nome', with: 'Case')
    expect(page).to have_select('Categoria', selected: 'Phone')
    expect(page).to have_field('Valor', with: 10.0)
    expect(page).to have_field('Valor Base', with: 7.0)
    expect(page).to have_field('Imagem', with: 'http://www.example.com')
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    new_category = Category.create(name: 'Phone')
    Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: new_category)

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ver Produto'
    click_on 'Editar'
    fill_in 'Nome', with: 'Bag'
    fill_in 'Valor', with: '12'
    click_on 'Cadastrar'

    expect(page).to have_content 'Produto atualizado'
    expect(page).to have_content 'Bag'
    expect(page).to have_content '12.0'
  end

  it 'fail' do
    user = User.create(email: 'example@example.com', password: 'password')
    new_category = Category.create(name: 'Phone')
    Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: new_category)

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ver Produto'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'Valor', with: '12'
    fill_in 'Valor', with: ''
    fill_in 'Imagem', with: 'http://www.example.com'
    click_on 'Cadastrar'

    expect(page).to have_content('Não foi possível atualizar')
  end
end
