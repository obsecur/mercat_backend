# frozen_string_literal: true

require "rails_helper"

describe "DELETE /v1/api/users/1", type: :request do
  let(:user) { create(:user) }
  
  it "returns head no content" do
    delete v1_api_user_path(user.id), as: :json
    expect(response).to have_http_status(:no_content)
  end
end
