# frozen_string_literal: true

require "rails_helper"

describe "POST /v1/api/books", type: :request do
  let(:endpoint) { post v1_api_books_url, params: params, as: :json }

  context "when a validation fails" do
    let(:params) do
      {
        book: {
          title: "Don Quijote de la Mancha"
        }
      }
    end

    it "renders unprocessable entity" do
      endpoint
      expect(response).to have_http_status :unprocessable_entity
    end

    it "doesn't create a book" do
      expect { endpoint }.not_to change(Book, :count)
    end
  end

  context "with valid params" do
    let(:params) do
      {
        book: {
          isbn_code: "AA123",
          publication_at: "2022-06-27",
          title: "Don Quijote de la Mancha"
        }
      }
    end

    it "succeeds" do
      endpoint
      expect(response).to have_http_status(:created)
    end

    it "creates a book" do
      expect { endpoint }.to change(Book, :count).by(1)
    end
  end
end
