require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
  let!(:admin) { create(:user, :admin) }
  let!(:category) { create(:resource_category, name: 'Food') }

  scenario 'admin deletes a resource category' do
    log_in_as admin

    visit resource_category_path(category)

    click_link 'Delete'

    expect(page).to have_content("Category Food was deleted")
  end
end