require 'rails_helper'

RSpec.describe Ticket, type: :model do
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
    
    it do
      should allow_value('+1 541 322 5655').for(:phone)
        .for(:phone)
    end

    it do 
      should_not allow_value('541').for(:phone)
    end
  end
  it "exists" do
    Ticket.new
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

end
