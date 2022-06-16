# frozen_string_literal: true

require 'rails_helper'

describe 'User register a new product' do
  it 'and must log in' do
    visit new_product_path

    expect(current_path).to eq new_user_session_path
  end

  it 'in products_path' do
    user = User.create(email: 'example@example.com', password: 'password')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ver Produtos'
    click_on 'Cadastrar Produto'

    expect(page).to have_field 'Nome'
    expect(page).to have_field 'Categoria'
    expect(page).to have_field 'Valor'
    expect(page).to have_field 'Valor Base'
    expect(page).to have_field 'Imagem'
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    Category.create(name: 'Phone')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ver Produtos'
    click_on 'Cadastrar Produto'
    fill_in 'Nome', with: 'Case'
    fill_in 'Valor', with: '11'
    fill_in 'Valor Base', with: '10'
    fill_in 'Imagem', with: 'http://www.example.com'
    select 'Phone', from: 'Categoria'
    click_on 'Cadastrar'

    expect(current_path).to eq products_path
    expect(page).to have_content 'Produto cadastrado'
  end

  it 'fail' do
    user = User.create(email: 'example@example.com', password: 'password')
    Category.create(name: 'Phone')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ver Produtos'
    click_on 'Cadastrar Produto'
    fill_in 'Nome', with: 'Case'
    fill_in 'Valor', with: ''
    fill_in 'Valor Base', with: ''
    fill_in 'Imagem', with: 'http://www.example.com'
    select 'Phone', from: 'Categoria'
    click_on 'Cadastrar'

    expect(page).to have_content 'Verifique os erros abaixo:'
    expect(page).to have_content 'Valor não pode ficar em branco'
    expect(page).to have_content 'Valor Base não pode ficar em branco'
  end
end
