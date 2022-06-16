# frozen_string_literal: true

require 'rails_helper'

describe 'User deletes a client' do
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
    click_on 'Deletar'

    expect(page).to have_content 'Cliente deletado com sucesso'
    expect(page).not_to have_content 'Pedrinho'
    expect(page).not_to have_content 'Rua um dia vai, 1234, Belo Horizonte - Minas Gerais'
  end

  it 'does not delete others' do
    user = User.create(email: 'example@example.com', password: 'password')
    Client.create(name: 'Pedrinho', address: 'Rua um dia vai, 1234', state: 'Minas Gerais', city: 'Belo Horizonte',
                  email: 'example@example.com')
    Client.create(name: 'Pedro', address: 'Rua um dia, 134', state: 'São Paulo', city: 'São Paulo',
                  email: 'exaample@example.com')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Clientes'
    click_on 'Pedrinho'
    click_on 'Deletar'

    expect(page).to have_content 'Cliente deletado com sucesso'
    expect(page).to have_content 'Pedro'
    expect(page).to have_content 'Rua um dia, 134, São Paulo - São Paulo'
  end
end
