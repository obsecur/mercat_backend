# frozen_string_literal: true

module V1
  module Api
    class BookSerializer < ApplicationSerializer
      attributes :id,
                 :title,
                 :author_name,
                 :isbn_code,
                 :publication_at,
                 :status
    end
  end
end
