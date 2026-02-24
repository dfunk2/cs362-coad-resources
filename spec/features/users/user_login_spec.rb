require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
scenario 'organization user logs in with valid credentials' do
    user = create(:user) 

    visit '/login'  

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123'
    click_button 'Sign in'                  

    # Confirm login was successful
    expect(page).to have_content('Dashboard')
    expect(page).to have_content('Organizations')
  end

  scenario 'organization user fails to log in with invalid credentials' do
    visit '/login'

    fill_in 'Email', with: 'wrong@example.com'
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Sign in'

    expect(page).to have_content('Invalid Email or password')
  end
end
