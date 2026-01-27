require 'rails_helper'

RSpec.describe User, type: :model do
# it "exists" do
#     User.new
#   end 

  describe "validations" do 
    it { should validate_presence_of(:email)}
    it {should validate_length_of(:email).is_at_least(1).is_at_most(255)}
    it {should validate_uniqueness_of(:email).case_insensitive}
    it { should validate_presence_of(:password)}    
    it {should validate_length_of(:password).is_at_least(7).is_at_most(255)}
    
    it do
      should allow_value("user@gmail.com").for(:email)
    end
    it do
      should_not allow_value("user").for(:email)
    end

    it do
      
  end
end
