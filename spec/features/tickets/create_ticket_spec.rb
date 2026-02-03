require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do
  let!(:region) { create(:region, name: 'Bend') }
  let!(:category) { create(:resource_category, name: 'Food') }

  scenario 'guest user creates a ticket successfully' do
    visit new_ticket_path

    fill_in 'Full Name', with: 'John Doe'
    fill_in 'Phone Number', with: '+15035551234'
    fill_in 'Description', with: 'Need help with food'
    select 'Bend', from: 'Region'
    select 'Food', from: 'Resource Category'

    click_button 'Send this help request'

    expect(page).to have_content('Ticket Submitted')
    expect(page).to have_content('An organization will contact you shortly')
  end

  scenario 'ticket creation fails without required fields' do
    visit new_ticket_path

    click_button 'Send this help request'

    expect(page).to have_content("can't be blank")
  end
end
