# frozen_string_literal: true

class CreateTransactionCommand
  prepend BaseCommand

  attr_reader :transaction

  validates :type,
            :operation_at,
            :expires_at,
            :user_id,
            :book_id,
            presence: true

  def initialize(user_id:, book_id:, type:, operation_at:, expires_at:)
    @user_id = user_id
    @book_id = book_id
    @type = type
    @operation_at = operation_at
    @expires_at = expires_at
  end

  def call
    if type == "order_book"
      book.in_use!
    else
      book.returned!
    end

    @transaction = Transaction.create!(transaction_params)
  end

  private
    attr_reader :params, :user_id, :book_id, :type, :operation_at, :expires_at

    def transaction_params
      {
        user_id: user_id,
        book_id: book_id,
        type: type,
        operation_at: operation_at,
        expires_at: expires_at
      }
    end

    def book
      @book = Book.find(book_id)
    end
end
