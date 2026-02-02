require 'rails_helper'

RSpec.describe User, type: :model do
  let(:org) {create(:organization)}
  let(:org_user) {create(:user, organization: org)}
  let(:user_email) {create(:user, email: "jane@example.com")}
# it "exists" do
#     User.new
#   end 

  describe "validations" do 
    it { should validate_presence_of(:email)}
    it {should validate_length_of(:email).is_at_least(1).is_at_most(255)}
    it {should validate_uniqueness_of(:email).case_insensitive}
    it { should validate_presence_of(:password)}    
    it {should validate_length_of(:password).is_at_least(7).is_at_most(255)}

    it { should allow_value('user@gmail.com').for(:email) }
    it { should_not allow_value('user').for(:email) }
  end

  describe 'attributes' do
    it { should respond_to(:email) }
    it { should respond_to(:role) }
  end

  describe 'associations' do
    it { should belong_to(:organization).optional }
  end

  describe "to_s" do
    it "returns email of user" do
      expect(user_email.to_s).to eq("jane@example.com")
    end
  end

  describe "set default role" do
    it "user is an organization" do
      org_user.set_default_role
      expect(org_user.role).to eq("organization")
    end
  end
end
