require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
  let!(:admin) { create(:user, :admin, email: 'admin@test.com', password: 'password123', confirmed_at: Time.now) }
  let!(:category) { create(:resource_category, name: 'Food') }

  scenario 'admin deletes a resource category' do
    visit new_user_session_path
    fill_in 'Email', with: 'admin@test.com'
    fill_in 'Password', with: 'password123'
    click_button 'Log in'

    visit resource_categories_path

    within "#resource_category_#{category.id}" do
      click_link 'Delete'
    end

    expect(page).to have_content('Resource category was successfully destroyed')
    expect(page).not_to have_content('Food')
  end
end
