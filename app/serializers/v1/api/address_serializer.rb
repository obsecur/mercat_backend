# frozen_string_literal: true

module V1
  module Api
    class AddressSerializer < ApplicationSerializer
      attributes :id,
                 :street,
                 :street_number,
                 :city,
                 :country,
                 :zipcode
    end
  end
end
