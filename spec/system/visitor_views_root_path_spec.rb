# frozen_string_literal: true

require 'rails_helper'

describe 'Visitor visit root_path' do
  it 'and sees' do
    visit root_path

    expect(page).to have_content 'Bem-vindo a Acme Commerce!'
  end
end
