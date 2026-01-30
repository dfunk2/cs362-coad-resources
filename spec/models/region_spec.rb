require 'rails_helper'

RSpec.describe Region, type: :model do

  # it "exists" do
  #   Region.new
  # end

  # it "has a name" do
  #   region = Region.new
  #   expect(region).to respond_to(:name)
  # end

  # it "has a string representation that is its name" do
  #   name = 'Mt. Hood'
  #   region = Region.new(name: name)
  #   result = region.to_s
  # end
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_length_of(:name).is_at_least(1).is_at_most(255)}
    it {should validate_uniqueness_of(:name).case_insensitive}
  end

  describe 'methods' do
    it "has a string representation that is its name" do
      region = build(:region, name: 'Mt. Hood')
      expect(region.to_s).to eq('Mt. Hood')
    end
  end
  
  describe 'attributes' do
    it {should respond_to(:name)}
  end

  describe 'associations' do
    it {should have_many(:tickets)}
  end

end
