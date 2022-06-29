# frozen_string_literal: true

require "rails_helper"

describe "GET /v1/api/users", type: :request do
  let!(:users) { create_list(:user, 4) }

  let(:endpoint) { get v1_api_users_path, as: :json }

  context "when there are users" do
    before do
      endpoint
    end

    it "succeeds" do
      expect(response).to have_http_status(:ok)
    end

    it "returns all the users" do
      expect(data.size).to eq(4)
    end
  end
end
