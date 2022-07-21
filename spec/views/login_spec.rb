require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  before :each do
    User.create!(name: 'Testing', posts_counter: 0, email: 'user@example.com', password: 'password',
                confirmed_at: '2022-03-02 22:25:13.71382')
  end

  it 'can enter a name and receive a greeting' do
    visit user_session_path
    expect(page).to have_content 'Log in'
  end

  it 'user can see inputs and button' do
    visit user_session_path
    expect(page).to have_current_path(user_session_path)
  end

  it 'click the login button with no inputs' do
    visit user_session_path
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'click the login button with wrong inputs ' do
    visit 'users/sign_in'
    within('form') do
      fill_in 'user[email]', with: 'incorrect@incorrect'
      fill_in 'user[password]', with: 'incorrect'
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
