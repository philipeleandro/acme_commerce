# frozen_string_literal: true

require 'rails_helper'

describe 'User registers a category' do
  it 'and must log in' do
    visit new_category_path

    expect(current_path).to eq new_user_session_path
  end

  it 'in new_category_path' do
    user = User.create(email: 'example@example.com', password: 'password')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Categorias'
    click_on 'Nova Categoria'

    expect(page).to have_field 'Nome'
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')

    login_as(user)
    visit new_category_path
    fill_in 'Nome', with: 'Bag'
    click_on 'Cadastrar'

    expect(page).to have_content 'Categoria cadastrada'
    expect(page).to have_content 'Bag'
  end

  it 'fail with empty data' do
    user = User.create(email: 'example@example.com', password: 'password')

    login_as(user)
    visit new_category_path
    fill_in 'Nome', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content 'Não foi possível cadastrar'
  end
end
