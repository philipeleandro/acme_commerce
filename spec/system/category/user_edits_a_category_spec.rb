require 'rails_helper'

describe "User edits a category" do
  it 'and must log in' do
    category = Category.create(name: 'Bag')

    visit edit_category_path(category.id)

    expect(current_path).to eq new_user_session_path
  end

  it 'in categories_path' do
    user = User.create(email: 'example@example.com', password: 'password')
    category = Category.create(name: 'Bag')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Categorias'
    click_on 'Editar'

    expect(page).to have_field('Nome', with: 'Bag')
  end 

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    category = Category.create(name: 'Bag')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Categorias'
    click_on 'Editar'
    fill_in 'Nome', with: 'Pedrinho Campeonato'
    click_on 'Cadastrar'

    expect(page).to have_content 'Categoria atualizada com sucesso'
    expect(page).to have_content 'Pedrinho Campeonato'
  end

  it 'fail' do
    user = User.create(email: 'example@example.com', password: 'password')
    category = Category.create(name: 'Bag')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'
    click_on 'Categorias'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content('Não foi possível atualizar')
  end
end
