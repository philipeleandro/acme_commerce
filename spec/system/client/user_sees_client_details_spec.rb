require 'rails_helper'

describe 'User sees a client details' do
  it 'and must log in' do
    client = Client.create(name: 'Pedrinho', address: 'Rua um dia vai, 1234', state: 'Minas Gerais', city: 'Belo Horizonte', email: 'pedrinho@example.com')
    visit client_path(client.id)

    expect(current_path).to eq new_user_session_path
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    Client.create(name: 'Pedrinho', address: 'Rua um dia vai, 1234', state: 'Minas Gerais', city: 'Belo Horizonte', email: 'pedrinho@example.com')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Clientes'
    click_on 'Pedrinho'

    expect(page).to have_content 'Nome: Pedrinho'
    expect(page).to have_content 'Endereço: Rua um dia vai, 1234'
    expect(page).to have_content 'Cidade: Belo Horizonte'
    expect(page).to have_content 'Estado: Minas Gerais'
    expect(page).to have_content 'Email: pedrinho@example.com'
  end

  it 'return when clicks on Voltar' do
    user = User.create(email: 'example@example.com', password: 'password')
    client = Client.create(name: 'Pedrinho', address: 'Rua um dia vai, 1234', state: 'Minas Gerais', city: 'Belo Horizonte', email: 'pedrinho@example.com')

    login_as(user)
    visit client_path(client.id)
    click_on 'Voltar'

    expect(current_path).to eq clients_path
  end
end
