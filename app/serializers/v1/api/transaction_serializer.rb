# frozen_string_literal: true

module V1
  module Api
    class TransactionSerializer < ApplicationSerializer
      attributes :id,
                 :operation_at,
                 :expires_at,
                 :type

      has_one :user, serializer: IndexUserSerializer
      has_one :book, serializer: BookSerializer
    end
  end
end
