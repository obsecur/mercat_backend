# frozen_string_literal: true

module V1
  module Api
    class UserSerializer < ApplicationSerializer
      attributes :id,
                 :name,
                 :phone,
                 :email

      has_one :address, serializer: AddressSerializer
    end
  end
end
