require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  it "renders index page successfully" do
    get :index
    expect(response).to have_http_status(:success)
  end

  it "renders ticket_submitted page successfully" do
    get :ticket_submitted
    expect(response).to have_http_status(:success)
  end

  it "renders organization_expectations page successfully" do
    get :organization_expectations
    expect(response).to have_http_status(:success)
  end
end
