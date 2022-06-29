# frozen_string_literal: true

module V1
  module Api
    class IndexBookSerializer < ApplicationSerializer
      attributes :id,
                 :title,
                 :isbn_code,
                 :status,
                 :publication_at,
                 :author_name
    end
  end
end
