require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
  scenario "successfully deletes a region" do
    admin = create(:user, role: "admin")
    region = create(:region, name: "Central Oregon")
    log_in_as(admin)
    visit regions_path
    click_link "Central Oregon"
    click_link "Delete"
    expect(page).to have_content("Unspecified")
    expect(page).not_to have_link("Central Oregon")
  end
end
