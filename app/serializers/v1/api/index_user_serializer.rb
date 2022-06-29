# frozen_string_literal: true

module V1
  module Api
    class IndexUserSerializer < ApplicationSerializer
      attributes :id,
                 :name,
                 :phone,
                 :email
    end
  end
end
