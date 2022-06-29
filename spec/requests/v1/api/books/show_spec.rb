# frozen_string_literal: true

require "rails_helper"

describe "GET /v1/api/books/1", type: :request do
  let(:book) { create(:book) }

  let(:endpoint) { get v1_api_book_path(book.id), as: :json }

  it "returns http success" do
    endpoint
    expect(response).to have_http_status(:success)
  end

  it "returns book" do
    endpoint
    expect(data["id"]).to eq book.id
  end
end
