# frozen_string_literal: true

require 'rails_helper'

describe 'User deletes a category' do
  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    Category.create(name: 'Bag')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Categorias'
    click_on 'Deletar'

    expect(page).to have_content 'Categoria deletada'
    expect(page).not_to have_content 'Bag'
  end
end
