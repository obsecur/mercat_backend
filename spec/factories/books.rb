# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id             :bigint           not null, primary key
#  author_name    :string
#  isbn_code      :string           not null
#  publication_at :date             not null
#  status         :string           default("available"), not null
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :book do
    title { "MyString" }
    publication_at { "2022-06-27" }
    author_name { "MyString" }
    isbn_code { "MyString" }
  end
end
