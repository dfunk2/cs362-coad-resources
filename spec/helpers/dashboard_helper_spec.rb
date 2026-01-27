require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  describe '#dashboard_for' do
    it 'returns admin_dashboard for admin user' do
      user = double('User', admin?: true)
      expect(helper.dashboard_for(user)).to eq('admin_dashboard')
    end

    it 'returns organization_submitted_dashboard when organization is submitted' do
      organization = double('Organization', submitted?: true, approved?: false)
      user = double('User', admin?: false, organization: organization)
      expect(helper.dashboard_for(user)).to eq('organization_submitted_dashboard')
    end

    it 'returns organization_approved_dashboard when organization is approved' do
      organization = double('Organization', submitted?: false, approved?: true)
      user = double('User', admin?: false, organization: organization)
      expect(helper.dashboard_for(user)).to eq('organization_approved_dashboard')
    end

    it 'returns create_application_dashboard when user has no organization' do
      user = double('User', admin?: false, organization: nil)
      expect(helper.dashboard_for(user)).to eq('create_application_dashboard')
    end
  end
end
