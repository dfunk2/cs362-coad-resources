require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  let(:admin) { create(:user, role: "admin") }
  let(:user)  { create(:user, role: "organization") }

  describe "GET index" do
    context "when not logged in" do
      it "redirects to sign in" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when logged in as organization" do
      it "redirects away" do
        sign_in user
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when logged in as admin" do
      it "is successful" do
        sign_in admin
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end

