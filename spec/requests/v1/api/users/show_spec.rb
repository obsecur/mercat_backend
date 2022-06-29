# frozen_string_literal: true

require "rails_helper"

describe "GET /v1/api/users/1", type: :request do
  let(:user) { create(:user) }

  let(:endpoint) { get v1_api_user_path(user.id), as: :json }

  it "returns http success" do
    endpoint
    expect(response).to have_http_status(:success)
  end

  it "returns user" do
    endpoint
    expect(data["id"]).to eq user.id
  end
end
