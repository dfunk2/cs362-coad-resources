require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:test_ticket) {create(:ticket)}
  let(:org) {create(:organization)}
  let(:ticket_with_org) {create(:ticket, organization: org)}
  let(:ticket_without_org) {create(:ticket, organization: nil)}

  # it "exists" do
  #   Ticket.new
  # end
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:region_id)}
    it {should validate_presence_of(:resource_category_id)}
    it {should validate_length_of(:name).is_at_least(1).is_at_most(255)}
    it {should validate_length_of(:description).is_at_most(1020)}
    
    it { should allow_value('+1 541 322 5655').for(:phone) }
    it { should_not allow_value('541').for(:phone) }

  end 

  describe 'attributes' do
    it {should respond_to(:name)}
    it {should respond_to(:description)}
    it {should respond_to(:phone)}
    it {should respond_to(:organization_id)}
    it {should respond_to(:closed)}
    it {should respond_to(:closed_at)}
    it {should respond_to(:resource_category_id)}
    it {should respond_to(:region_id)}
  end

  describe 'associations' do 
    it {should belong_to(:region)}
    it {should belong_to(:resource_category)}
    it {should belong_to(:organization).optional}
  end

  describe "to_s" do 
    it "returns name of ticket" do
      test_ticket.save
      expect(test_ticket.to_s).to eq("Ticket #{test_ticket.id}")
    end
  end

  describe "open?" do
    it "checks if open" do
      test_ticket.closed = false
      expect(test_ticket.open?).to be true
      test_ticket.closed = true
      expect(test_ticket.open?).to be false
    end
  end

  describe "captured?" do
    it "ticket has organization" do
      expect(ticket_with_org.captured?).to be true
    end 
    it "ticket withou organization" do
      expect(ticket_without_org.captured?).to be false
    end 
  end 

  describe 'scopes' do
    let!(:open_ticket) { create(:ticket, closed: false, organization: nil) }
    let!(:closed_ticket) { create(:ticket, closed: true) }
    let!(:org) { create(:organization) }
    let!(:captured_ticket) { create(:ticket, closed: false, organization: org) }
    let!(:closed_org_ticket) { create(:ticket, closed: true, organization: org) }
    let!(:region) { create(:region) }
    let!(:region_ticket) { create(:ticket, region: region) }
    let!(:category) { create(:resource_category) }
    let!(:category_ticket) { create(:ticket, resource_category: category) }
  
    describe '.open' do
      it 'returns tickets that are open and not captured' do
        expect(Ticket.open).to include(open_ticket)
        expect(Ticket.open).not_to include(closed_ticket)
        expect(Ticket.open).not_to include(captured_ticket)
      end
    end
  
    describe '.closed' do
      it 'returns tickets that are closed' do
        expect(Ticket.closed).to include(closed_ticket)
        expect(Ticket.closed).to include(closed_org_ticket)
        expect(Ticket.closed).not_to include(open_ticket)
      end
    end
  
    describe '.all_organization' do
      it 'returns tickets that are not closed and have an organization' do
        expect(Ticket.all_organization).to include(captured_ticket)
        expect(Ticket.all_organization).not_to include(open_ticket)
        expect(Ticket.all_organization).not_to include(closed_ticket)
      end
    end
  
    describe '.organization' do
      it 'returns open tickets for a specific organization' do
        expect(Ticket.organization(org.id)).to include(captured_ticket)
        expect(Ticket.organization(org.id)).not_to include(closed_org_ticket)
        expect(Ticket.organization(org.id)).not_to include(open_ticket)
      end
    end
  
    describe '.closed_organization' do
      it 'returns closed tickets for a specific organization' do
        expect(Ticket.closed_organization(org.id)).to include(closed_org_ticket)
        expect(Ticket.closed_organization(org.id)).not_to include(captured_ticket)
      end
    end
  
    describe '.region' do
      it 'returns tickets for a specific region' do
        expect(Ticket.region(region.id)).to include(region_ticket)
      end
    end
  
    describe '.resource_category' do
      it 'returns tickets for a specific resource category' do
        expect(Ticket.resource_category(category.id)).to include(category_ticket)
      end
    end
  end
end
