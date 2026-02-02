require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:category) {create:resource_category, name: "first aid"}
# it "exists" do
#     ResourceCategory.new
#   end 
  describe "validations" do 
    it {should validate_presence_of(:name)}
    it {should validate_length_of(:name).is_at_least(1).is_at_most(255)}
    it {should validate_uniqueness_of(:name).case_insensitive}
  end

  describe 'attribtues' do
    it {should respond_to(:name)}
    it {should respond_to(:active)}
  end

  describe 'associations' do
    it {should have_and_belong_to_many(:organizations)}
    it {should have_many(:tickets)}
  end

  describe "active" do
    it "returns true when active" do 
      category.activate
      expect(category.active).to be true
    end
  end

  
  describe "deactivate" do
    it "returns false when deactivated" do 
      category.deactivate
      expect(category.active).to be false
    end
  end

    describe "inactive?" do
    it "checks if inactive" do 
      category.deactivate
      expect(category.inactive?).to be true
      category.activate
      expect(category.inactive?).to be false
    end
  end

  describe "to_s" do
    it "returns name of category" do
      expect(category.to_s).to eq("first aid")
    end
  end

end
