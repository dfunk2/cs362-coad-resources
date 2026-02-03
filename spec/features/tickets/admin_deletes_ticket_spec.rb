require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  let!(:admin) { create(:user, :admin) }
  let!(:ticket) { create(:ticket, name: 'Jane Doe') }

  scenario 'admin deletes a ticket' do
    log_in_as admin

    visit ticket_path(ticket)

    click_link 'Delete'

    expect(page).to have_content("Ticket #{ticket.id} was deleted")
  end
end