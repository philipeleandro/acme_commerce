require 'rails_helper'

describe 'User sees all categories' do
  it 'and must log in' do
    category = Category.create(name: 'Case')

    visit filter_product_category_path(category.id)

    expect(current_path).to eq new_user_session_path
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    category = Category.create(name: 'Case')
    new_product = Product.create(name: 'Case', value: 10, base_value: 7, image_url: 'http://www.example.com', category: category)

    login_as(user)
    visit root_path
    click_on 'Categorias de Produtos'
    within('table') do
      click_on 'Produto'
    end

    expect(page).to have_content 'Produtos'
    expect(page).to have_content 'Case'
    expect(page).to have_content '10'
    expect(page).to have_content 'http://www.example.com'
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')
    category = Category.create(name: 'Case')
    
    login_as(user)
    visit root_path
    click_on 'Categorias de Produtos'
    click_on 'Produtos'

    expect(page).to have_content 'Não há produto nessa categoria'
  end
end