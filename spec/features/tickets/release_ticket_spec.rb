require 'rails_helper'

RSpec.describe 'Releasing a ticket by an organization user', type: :feature do
  let!(:user) { create(:user) }
  let!(:ticket) { create(:ticket, name: 'Jane Doe', closed: false, organization: user.organization) }

  scenario 'organization user releases a captured ticket' do
    log_in_as user

    visit ticket_path(ticket)

    click_link 'Release'

    ticket.reload
    expect(ticket.organization).to be_nil
  end
end