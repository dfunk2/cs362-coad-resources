require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
  scenario "successfully creates a region" do
    admin = create(:user, role: "admin")
    log_in_as(admin)
    visit regions_path
    click_link "Add Region"
    fill_in "Name", with: "Central Oregon"
    click_button "Add Region"
    expect(page).to have_content("Central Oregon")
  end
end
