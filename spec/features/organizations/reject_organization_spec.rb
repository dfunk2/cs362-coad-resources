require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do

  scenario 'admin sees organizations grouped by status' do
    admin = create(:user, role: 'admin')

    approved_org = create(:organization, name: 'Approved Org', status: :approved)
    pending_org  = create(:organization, name: 'Pending Org', status: :submitted)
    rejected_org = create(:organization, name: 'Rejected Org', status: :rejected)

    log_in_as(admin)
    visit organizations_path
     #Approved tab
    click_on 'Approved'
    within('#approved') do
      expect(page).to have_content('Approved Org')
      expect(page).not_to have_content('Pending Org')
      expect(page).not_to have_content('Rejected Org')
    end

    # Pending tab
    click_on 'Pending'
    within('#pending') do
      expect(page).to have_content('Pending Org')
      expect(page).not_to have_content('Approved Org')
      expect(page).not_to have_content('Rejected Org')
    end

    #Rejected tab
    click_on 'Rejected'
    within('#rejected') do
      expect(page).to have_content('Rejected Org')
      expect(page).not_to have_content('Approved Org')
      expect(page).not_to have_content('Pending Org')
    end
  end
end
