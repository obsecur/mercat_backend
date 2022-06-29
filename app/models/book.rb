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
class Book < ApplicationRecord
  enum status: { available: "available", in_use: "in use", returned: "returned" }

  # Associations
  has_many :user_books
  has_many :users, through: :user_books
  has_many :transactions

  # Validations
  validates :publication_at,
            :status,
            :title,
            presence: true

  validates :isbn_code, uniqueness: { case_sensitive: false }
end
