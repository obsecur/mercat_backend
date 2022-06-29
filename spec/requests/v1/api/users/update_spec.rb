# frozen_string_literal: true

require "rails_helper"

describe "PUT /v1/api/users/1", type: :request do
  let!(:user) { create(:user) }

  before do
    put v1_api_user_path(user.id), params: params, as: :json
  end

  context "when update name user" do
    let(:new_name) { "New Name" }

    let(:params) do
      {
        name: new_name
      }
    end

    it "updated user name" do
      expect(data["name"]).to eq(new_name)
    end

    it "succeeds" do
      expect(response).to have_http_status(:ok)
    end
  end
end
