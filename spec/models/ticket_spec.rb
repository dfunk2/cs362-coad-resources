require 'rails_helper'

RSpec.describe Ticket, type: :model do
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

end
