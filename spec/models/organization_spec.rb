require 'rails_helper'

RSpec.describe Organization, type: :model do
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


    it do
      should allow_value('test@gmail.com').for(:email)
    end

    it do
      should_not allow_value('invalid_email').for(:email)
    end
  end 
end
