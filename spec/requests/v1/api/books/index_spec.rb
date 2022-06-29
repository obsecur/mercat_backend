# frozen_string_literal: true

require "rails_helper"

describe "GET /v1/api/books", type: :request do
  let!(:books) { create_list(:book, 4) }

  let(:endpoint) { get v1_api_books_path, as: :json }

  context "when there are books" do
    before do
      endpoint
    end

    it "succeeds" do
      expect(response).to have_http_status(:ok)
    end

    it "returns all the books" do
      expect(data.size).to eq(4)
    end
  end
end
