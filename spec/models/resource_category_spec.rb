require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
# it "exists" do
#     ResourceCategory.new
#   end 
  describe "validations" do 
    it {should validate_presence_of(:name)}
    it {should validate_length_of(:name).is_at_least(1).is_at_most(255)}
    it {should validate_uniqueness_of(:name).case_insensitive}
  end
end
