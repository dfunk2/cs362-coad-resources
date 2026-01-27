require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do
  describe '#format_phone_number' do
    it 'forms a US phone number' do
      expect(helper.format_phone_number('5035551234')).to eq('+15035551234')
    end

    it 'formats a phone number with dashes' do
      expect(helper.format_phone_number('503-555-1234')).to eq('+15035551234')
    end

    it 'formats a phone number with parentheses and spaces' do
      expect(helper.format_phone_number('(503) 555-1234')).to eq('+15035551234')
    end
  end

end
