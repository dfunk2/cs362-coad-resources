require 'rails_helper'

RSpec.describe User, type: :model do
  it "exists" do
    User.new
  end
  
  describe 'attributes' do
    it {should respond_to(:email)}
    it {should respond_to(:role)}
  end

end
