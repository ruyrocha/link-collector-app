require 'rails_helper'

RSpec.describe 'User registration', type: :system do
  scenario 'with valid data' do
    user = build(:user)

    visit new_user_registration_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'invalid when email already exists' do
    user = create :user

    visit new_user_registration_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'

    expect(page).to have_text 'Email has already been taken'
  end
end

RSpec.describe 'User signs in', type: :system do
  scenario 'with valid data' do
    user = create :user

    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully.'
  end

  scenario 'invalid when using invalid credentials' do
    visit new_user_session_path

    fill_in 'user_email', with: 'someone@example.tld'
    fill_in 'user_password', with: 'something'
    click_button 'Log in'

    expect(page).to have_text 'Invalid Email or password.'
  end
end
