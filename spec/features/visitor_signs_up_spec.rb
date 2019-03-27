require 'spec_helper'

RSpec.describe 'Visitor signs up', type: :feature do
  context 'with valid email and password' do
    it 'redirects to new team page ' do
      sign_up_with 'valid@example.com', 'password'
      User.find_by(email: 'valid@example.com').delete # rspec wasnt resetting the test db properly
      expect(page).to have_content('New team')
    end
  end

  context 'with invalid email' do
    it 'redirects to signup' do
      sign_up_with 'invalid_email', 'password'
      expect(page).to have_content('Email is invalid')
    end
  end

  context 'with invalid password' do
    it 'redirects to signup with blank password' do
      sign_up_with 'valid@example.com', ''
      expect(page).to have_content('Password can\'t be blank')
    end
  end
end