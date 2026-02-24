require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  scenario 'admin approves a pending organization' do
    admin = create(:user, role: 'admin')
    org = create(:organization, name: 'meals on wheels', status: 'submitted')

    log_in_as(admin)
    visit organizations_url

    expect(page).to have_content("meals on wheels")
    expect(page).to have_content("Pending")

    click_link 'Approve'

    expect(page).to have_content("meals on wheels")
    expect(page).to have_content("Approved")
  end 
end
