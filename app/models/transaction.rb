# frozen_string_literal: true

# == Schema Information
#
# Table name: transactions
#
#  id           :bigint           not null, primary key
#  expires_at   :datetime
#  operation_at :date             not null
#  type         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  book_id      :bigint
#  user_id      :bigint
#
# Indexes
#
#  index_transactions_on_book_id  (book_id)
#  index_transactions_on_user_id  (user_id)
#
class Transaction < ApplicationRecord
  self.inheritance_column = :_type_disabled

  enum type: { order_book: "order book", refund: "refund" }

  # Associations
  belongs_to :user
  belongs_to :book

  # Validations
  validates :type,
            :operation_at,
            :expires_at,
            presence: true

  # Scopes & Callbacks
  after_create :send_order_book_information

  def send_order_book_information
    TransactionMailer.transaction_created(self).deliver_now
  end
end
