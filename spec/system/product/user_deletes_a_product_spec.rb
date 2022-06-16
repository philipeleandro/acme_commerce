# frozen_string_literal: true

require 'rails_helper'

describe 'User deletes a product' do
  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    category = Category.create(name: 'Phone')
    Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com',
                   category:)

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Ver Produtos'
    click_on 'Deletar'

    expect(page).to have_content 'Produto deletado'
    expect(page).not_to have_content 'Case'
    expect(page).not_to have_content 'Phone'
  end
end
