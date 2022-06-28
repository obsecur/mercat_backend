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
FactoryBot.define do
  factory :user_book do
    user
    book
  end
end
