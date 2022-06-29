# frozen_string_literal: true

require "rails_helper"

describe "GET /v1/api/transactions", type: :request do
  let!(:transactions) { create_list(:transaction, 4) }

  let(:endpoint) { get v1_api_transactions_path, as: :json }

  context "when there are transactions" do
    before do
      endpoint
    end

    it "succeeds" do
      expect(response).to have_http_status(:ok)
    end

    it "returns all the transactions" do
      expect(data.size).to eq(4)
    end
  end
end
