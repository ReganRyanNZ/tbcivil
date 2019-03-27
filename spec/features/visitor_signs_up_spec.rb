require 'spec_helper'

RSpec.describe 'Visitor signs up', type: :feature do
  fit 'successfully with valid email and password' do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  it 'redirects to signup with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end

  it 'redirects to signup with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end
end