require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  #no argument gives the default title
  describe '#full_title' do
    it 'returns the main title when no page title is provided' do
      expect(helper.full_title).to eq('Disaster Resource Network')
    end
  #argument given gives a formatted title
    it 'returns formatted title when a page title is provided' do
      expect(helper.full_title('Main')).to eq('Main | Disaster Resource Network')
    end
  end
end
