# frozen_string_literal: true

require "rails_helper"

describe "POST /v1/api/transactions", type: :request do
  let(:endpoint) { post v1_api_transactions_url, params: params, as: :json }

  let(:book) { create(:book) }
  let(:user) { create(:user) }

  context "when a validation fails" do
    let(:params) do
      {
        transaction: {
          expires_at: "2022-06-27"
        }
      }
    end

    it "renders unprocessable entity" do
      endpoint
      expect(response).to have_http_status :unprocessable_entity
    end

    it "doesn't create a transaction" do
      expect { endpoint }.not_to change(Transaction, :count)
    end
  end

  context "with valid params" do
    let(:params) do
      {
        transaction: {
          user_id: user.id,
          book_id: book.id,
          operation_at: Date.current,
          expires_at: "2022-06-27",
          type: "order_book"
        }
      }
    end

    it "succeeds" do
      endpoint
      expect(response).to have_http_status(:created)
    end

    it "creates a transaction" do
      expect { endpoint }.to change(Transaction, :count).by(1)
    end
  end
end
