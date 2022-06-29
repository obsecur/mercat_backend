# frozen_string_literal: true

module V1
  module Api
    class IndexTransactionSerializer < ApplicationSerializer
      attributes :id,
                 :operation_at,
                 :expires_at,
                 :type
    end
  end
end
