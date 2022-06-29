# frozen_string_literal: true

require "rails_helper"

describe "GET /v1/api/transactions/1", type: :request do
  let(:transaction) { create(:transaction) }

  let(:endpoint) { get v1_api_transaction_path(transaction.id), as: :json }

  it "returns http success" do
    endpoint
    expect(response).to have_http_status(:success)
  end

  it "returns transaction" do
    endpoint
    expect(data["id"]).to eq transaction.id
  end
end
