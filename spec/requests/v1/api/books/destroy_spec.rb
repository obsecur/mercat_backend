# frozen_string_literal: true

require "rails_helper"

describe "DELETE /v1/api/books/1", type: :request do
  let(:book) { create(:book) }

  it "returns head no content" do
    delete v1_api_book_path(book.id), as: :json
    expect(response).to have_http_status(:no_content)
  end
end
