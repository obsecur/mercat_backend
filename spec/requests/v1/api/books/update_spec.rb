# frozen_string_literal: true

require "rails_helper"

describe "PUT /v1/api/books/1", type: :request do
  let!(:book) { create(:book) }

  before do
    put v1_api_book_path(book.id), params: params, as: :json
  end

  context "when update title book" do
    let(:new_title) { "New title" }

    let(:params) do
      {
        title: new_title
      }
    end

    it "updated book title" do
      expect(data["title"]).to eq(new_title)
    end

    it "succeeds" do
      expect(response).to have_http_status(:ok)
    end
  end
end
