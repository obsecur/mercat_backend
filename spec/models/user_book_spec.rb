# frozen_string_literal: true

# == Schema Information
#
# Table name: user_books
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_user_books_on_book_id  (book_id)
#  index_user_books_on_user_id  (user_id)
#
require "rails_helper"

RSpec.describe UserBook, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
