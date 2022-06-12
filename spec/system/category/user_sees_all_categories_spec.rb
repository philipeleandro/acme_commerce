require 'rails_helper'

describe 'User sees all categories' do
  it 'and must log in' do
    visit categories_path

    expect(current_path).to eq new_user_session_path
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    Category.create(name: 'Case')
    Category.create(name: 'Bag')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Categorias de Produtos'
    
    expect(page).to have_content 'Nome da Categoria'
    expect(page).to have_content 'Case'
    expect(page).to have_content 'Bag'
  end

  it 'does not have category' do
    user = User.create(email: 'example@example.com', password: 'password')
  
    login_as(user)
    visit categories_path

    expect(page).to have_content 'Não há categoria de produto cadastrada'
  end
end