# frozen_string_literal: true

require "rails_helper"

describe "POST /v1/api/users", type: :request do
  let(:endpoint) { post v1_api_users_url, params: params, as: :json }

  context "when a validation fails" do
    let(:params) do
      {
        user: {
          email: "john@gmail.com"
        }
      }
    end

    it "renders unprocessable entity" do
      endpoint
      expect(response).to have_http_status :unprocessable_entity
    end

    it "doesn't create a user" do
      expect { endpoint }.not_to change(User, :count)
    end
  end

  context "with valid params" do
    let(:params) do
      {
        user: {
          name: "John",
          email: "johndoe@gmail.com"
        }
      }
    end

    it "succeeds" do
      endpoint
      expect(response).to have_http_status(:created)
    end

    it "creates a user" do
      expect { endpoint }.to change(User, :count).by(1)
    end
  end

  context "when come address attributes on request" do
    let(:params) do
      {
        user: {
          name: "John",
          email: "johndoe@gmail.com",
          address_attributes: {
            latitude: "latitude",
            longitude: "longitude",
            street_number: 1,
            country: "country",
            city: "city",
            street: "street",
            zipcode: "zipcode"
          }
        }
      }
    end

    it "succeeds" do
      endpoint
      expect(response).to have_http_status(:created)
      expect(data["address"]["id"]).to eq(User.last.address.id)
    end

    it "creates a user" do
      expect { endpoint }.to change(User, :count).by(1)
    end

    it "creates a address" do
      expect { endpoint }.to change(Address, :count).by(1)
    end
  end
end
