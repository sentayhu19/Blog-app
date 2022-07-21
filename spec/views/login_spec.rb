require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  before :each do
    User.create(name: 'Testing', posts_counter: 0, email: 'user@example.com', password: 'password',
                confirmed_at: '2022-07-19 22:25:13.71382')
  end

  it 'can see the log in button, user[email] and user[password]' do
    visit user_session_path
    expect(page).to have_content 'Log in'
    expect(page).to have_field 'user[email]'
    expect(page).to have_field 'user[password]'
  end

  it 'click the login button with no inputs' do
    visit user_session_path
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'click the login button with wrong inputs ' do
    visit 'users/sign_in'
    within('form') do
      fill_in 'user[email]', with: 'wronguser@incorrect'
      fill_in 'user[password]', with: 'wrongpassowrd'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'Login successfully' do
    visit user_session_path
    within('form') do
      fill_in 'user[email]', with: 'user@example.com'
      fill_in 'user[password]', with: 'password'
    end
    click_button 'Log in'
    expect(current_path).to eq root_path
  end
end
