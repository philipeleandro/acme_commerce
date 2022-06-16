# frozen_string_literal: true

require 'rails_helper'

describe 'User sees all clients' do
  it 'and must log in' do
    visit clients_path

    expect(current_path).to eq new_user_session_path
  end

  it 'success' do
    Client.create(name: 'Pedro Gomes', state: 'Ceará', city: 'Fortaleza', address: 'Rua das lutas, 1000',
                  email: 'pedrinho@example.com')
    Client.create(name: 'Pedro Júnior', state: 'Ceará', city: 'Fortaleza', address: 'Rua das lutas, 700',
                  email: 'example@example.com')
    user = User.create(email: 'example@example.com', password: 'password')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Clientes'

    expect(page).to have_content 'Pedro Gomes'
    expect(page).to have_content 'Rua das lutas, 1000, Fortaleza - Ceará'
    expect(page).to have_content 'Pedro Júnior'
    expect(page).to have_content 'Rua das lutas, 700, Fortaleza - Ceará'
  end

  it 'and does not have registed clients' do
    user = User.create(email: 'example@example.com', password: 'password')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Clientes'

    expect(page).to have_content 'Não há clientes cadastrados'
  end

  it 'returns when click on Voltar' do
    user = User.create(email: 'example@example.com', password: 'password')

    login_as(user)
    visit clients_path
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
