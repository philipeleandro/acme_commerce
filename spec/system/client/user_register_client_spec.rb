# frozen_string_literal: true

require 'rails_helper'

describe 'User register a new client' do
  it 'and must log in' do
    visit new_client_path

    expect(current_path).to eq new_user_session_path
  end

  it 'in clients_path' do
    user = User.create(email: 'example@example.com', password: 'password')

    login_as(user)
    visit clients_path
    click_on 'Cadastrar Cliente'

    expect(page).to have_field 'Nome'
    expect(page).to have_field 'Endereço'
    expect(page).to have_field 'Cidade'
    expect(page).to have_field 'Estado'
    expect(page).to have_field 'Email'
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')

    login_as(user)
    visit clients_path
    click_on 'Cadastrar Cliente'
    fill_in 'Nome', with: 'Pedro'
    fill_in 'Endereço', with: 'Rua da glória, 750'
    fill_in 'Cidade', with: 'Crato'
    fill_in 'Estado', with: 'Ceará'
    fill_in 'Email', with: 'example@exam.com'
    click_on 'Cadastrar'

    expect(current_path).to eq clients_path
    expect(page).to have_content 'Cliente cadastrado'
    expect(page).to have_content 'Pedro'
    expect(page).to have_content 'Rua da glória, 750, Crato - Ceará'
  end

  it 'fail with empty data' do
    user = User.create(email: 'example@example.com', password: 'password')

    login_as(user)
    visit clients_path
    click_on 'Cadastrar Cliente'
    fill_in 'Nome', with: 'Pedro'
    fill_in 'Endereço', with: ''
    fill_in 'Cidade', with: 'Crato'
    fill_in 'Estado', with: ''
    fill_in 'Email', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content 'Não foi possível cadastrar'
    expect(page).to have_content 'Verifique os erros abaixo:'
    expect(page).to have_content 'Endereço não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
    expect(page).to have_content 'Email não pode ficar em branco'
  end
end
