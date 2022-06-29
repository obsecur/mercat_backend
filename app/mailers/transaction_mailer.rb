# frozen_string_literal: true

class TransactionMailer < ApplicationMailer
  default from: "library@mercat.com"

  def transaction_created(transaction)
    @transaction = transaction
    @user = transaction.user
    @book = transaction.book

    mail(to: @user.email, subject: "Here you have aditional infomation for order book, check out!")
  end
end
