require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  it "exists" do
    ResourceCategory.new
  end 

  describe 'attribtues' do
    it {should respond_to(:name)}
    it {should respond_to(:active)}
  end

  describe 'associations' do
    it {should have_and_belong_to_many(:organizations)}
    it {should have_many(:tickets)}
  end

end
