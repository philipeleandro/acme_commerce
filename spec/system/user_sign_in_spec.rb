require 'rails_helper'


describe 'User sign in' do
  it 'in root_path' do
    visit root_path
    click_on 'Entrar'

    expect(current_path).to eq new_user_session_path
  end

  it 'success' do
    user = User.create(email: 'example@example.com', password: 'password')

    visit root_path
    click_on 'Entrar'
    login_as(user)
    click_on 'Log in'

    expect(current_path).to eq root_path
  end

  it 'fail' do
    user = User.create(email: 'example@example.com', password: 'password')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: 'passord'
    click_on 'Log in'

    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'Invalid Email or password'
  end
end
