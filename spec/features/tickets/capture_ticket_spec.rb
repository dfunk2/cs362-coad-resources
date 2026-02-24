require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  let!(:user) { create(:user) }
  let!(:ticket) { create(:ticket, closed: false, organization: nil) }

  scenario 'organization user captures an open ticket' do
    log_in_as user

    visit ticket_path(ticket)

    click_link 'Capture'

    ticket.reload
    expect(ticket.organization).to eq(user.organization)
  end
end