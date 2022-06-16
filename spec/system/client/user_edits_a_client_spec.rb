# frozen_string_literal: true

require 'rails_helper'

describe 'User edits a client' do
  it 'in client details' do
    user = User.create(email: 'example@example.com', password: 'password')
    Client.create(name: 'Pedrinho', address: 'Rua um dia vai, 1234', state: 'Minas Gerais', city: 'Belo Horizonte',
                  email: 'example@example.com')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Clientes'
    click_on 'Pedrinho'
    click_on 'Editar'

    expect(page).to have_field('Nome', with: 'Pedrinho')
    expect(page).to have_field('Endereço', with: 'Rua um dia vai, 1234')
    expect(page).to have_field('Estado', with: 'Minas Gerais')
    expect(page).to have_field('Cidade', with: 'Belo Horizonte')
    expect(page).to have_field('Email', with: 'example@example.com')
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    Client.create(name: 'Pedrinho', address: 'Rua um dia vai, 1234', state: 'Minas Gerais', city: 'Belo Horizonte',
                  email: 'example@example.com')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Clientes'
    click_on 'Pedrinho'
    click_on 'Editar'
    fill_in 'Endereço',	with: 'Rua nova, 14'
    click_on 'Cadastrar'

    expect(page).to have_content 'Cliente atualizado com sucesso'
    expect(page).to have_content 'Nome: Pedrinho'
    expect(page).to have_content 'Endereço: Rua nova, 14, Belo Horizonte - Minas Gerais'
  end

  it 'fail' do
    user = User.create(email: 'example@example.com', password: 'password')
    Client.create(name: 'Pedrinho', address: 'Rua um dia vai, 1234', state: 'Minas Gerais', city: 'Belo Horizonte',
                  email: 'example@example.com')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Clientes'
    click_on 'Pedrinho'
    click_on 'Editar'
    fill_in 'Endereço',	with: ''
    click_on 'Cadastrar'

    expect(page).to have_content('Não foi possível atualizar')
  end
end
