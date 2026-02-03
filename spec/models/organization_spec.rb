require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:org) {create:organization, name: "OSU Cascade"}
# it "exists" do
#     Organization.new
  describe "validations" do 
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:status)}
    it {should validate_presence_of(:primary_name)}
    it {should validate_presence_of(:secondary_name)}
    it {should validate_presence_of(:secondary_phone)}

    it{should validate_length_of(:email).is_at_least(1).is_at_most(255)}
    it{should validate_length_of(:name).is_at_least(1).is_at_most(255)}
    it{should validate_length_of(:description).is_at_most(1020)}

    it{should validate_uniqueness_of(:email).case_insensitive}
    it{should validate_uniqueness_of(:name).case_insensitive}

    it { should allow_value('test@gmail.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
  end 

  describe 'attributes' do
    it {should respond_to(:name)}
    it {should respond_to(:status)}
    it {should respond_to(:phone)}
    it {should respond_to(:email)}
    it {should respond_to(:description)}
    it {should respond_to(:rejection_reason)}
    it {should respond_to(:liability_insurance)}
    it {should respond_to(:primary_name)}
    it {should respond_to(:secondary_name)}
    it {should respond_to(:secondary_phone)}
    it {should respond_to(:title)}
    it {should respond_to(:transportation)}
  end

  describe 'associations' do 
    it {should have_many(:users)}
    it {should have_many(:tickets)}
    it {should have_and_belong_to_many(:resource_categories)}
  end

  describe "approve" do
    it "returns approved" do
      org.approve
      expect(org.status).to eq("approved")
    end
  end

  describe "reject" do
    it "returns rejected" do
      org.reject
      expect(org.status).to eq("rejected")
    end
  end

  describe "set default status" do
    it "returns submitted if status is nil" do
      org.status = nil
      org.set_default_status 
      expect(org.status).to eq("submitted")
    end
  end

  describe 'to_s' do
    it 'returns the organizations name' do
      expect(org.to_s).to eq("OSU Cascade")
    end
  end

  
end

