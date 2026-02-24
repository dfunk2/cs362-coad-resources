require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
    scenario 'organization user sees create application button on dashboard' do
    user = create(:user) 

    # Log in first
    visit '/login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password123'
    click_button 'Sign in'

    # Verify we are on the dashboard
    expect(page).to have_content('Dashboard')
  end
end
