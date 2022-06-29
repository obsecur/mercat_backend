# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  name       :string           not null
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  # Associations
  has_many :user_books
  has_many :books, through: :user_books
  has_many :transactions
  has_one :address

  accepts_nested_attributes_for :address

  # Validations
  validates :name,
            presence: true

  validates :email, uniqueness: { case_sensitive: false }
end
