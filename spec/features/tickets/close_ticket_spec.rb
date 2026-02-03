require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
  let!(:user) { create(:user) }
  let!(:ticket) { create(:ticket, name: 'Jane Doe', closed: false, organization: user.organization) }

  scenario 'organization user closes a captured ticket' do
    log_in_as user

    visit ticket_path(ticket)

    click_link 'Close'

    ticket.reload
    expect(ticket.closed).to be true
  end
end