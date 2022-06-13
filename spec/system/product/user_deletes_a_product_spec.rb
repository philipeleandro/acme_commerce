require 'rails_helper'

describe 'User deletes a product' do
  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    category = Category.create(name: 'Phone')
    product = Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: category)

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

  # it 'does not delete others' do
  #   user = User.create(email: 'example@example.com', password: 'password')
  #   Client.create(name: 'Pedrinho', address: 'Rua um dia vai, 1234', state: 'Minas Gerais', city: 'Belo Horizonte')
  #   Client.create(name: 'Pedro', address: 'Rua um dia, 134', state: 'São Paulo', city: 'São Paulo')
    
  #   visit root_path
  #   click_on 'Entrar'
  #   login_as(user)
  #   click_on 'Log in'
  #   click_on 'Clientes'
  #   click_on 'Pedrinho'
  #   click_on 'Deletar'

  #   expect(page).to have_content 'Cliente deletado com sucesso'
  #   expect(page).to have_content 'Pedro'
  #   expect(page).to have_content 'Rua um dia, 134, São Paulo - São Paulo'
  # end  
end