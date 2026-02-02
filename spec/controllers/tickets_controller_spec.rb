
require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:user) { create(:user, role: "organization") }
  let(:ticket) { create(:ticket) } 
  let(:ticket_attributes) { attributes_for(:ticket) }

  before do
    sign_in user 
  end

  describe "GET new" do
    it "is successfully" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "creates a ticket successfully" do
        post :create, params: { ticket: attributes_for(:ticket) }
        expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "redirects when logged in" do
      ticket = create(:ticket)
      get :show, params: { id: ticket.id }
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end

