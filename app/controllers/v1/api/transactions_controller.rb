# frozen_string_literal: true

module V1
  module Api
    class TransactionsController < ApiController
      def index
        render json: transactions, each_serializer: IndexTransactionSerializer, status: :ok
      end

      def create
        transaction_command = CreateTransactionCommand.call(**create_transaction_params)

        if transaction_command
          @transaction = transaction_command.transaction

          render json: @transaction, include: include_params, serializer: TransactionSerializer, status: :created
        else
          render_model_errors(transaction_command)
        end
      end

      def update
        if transaction.update(transaction_params)
          render json: transaction, serializer: TransactionSerializer, status: :ok
        else
          render_errors_for(transaction)
        end
      end

      def show
        render json: transaction, serializer: TransactionSerializer, status: :ok
      end

      private
        def transaction_params
          params.require(:transaction)
                .permit(
                  :user_id,
                  :book_id,
                  :operation_at,
                  :expires_at,
                  :type
                )
        end

        def create_transaction_params
          {
            user_id: transaction_params[:user_id],
            book_id: transaction_params[:book_id],
            operation_at: transaction_params[:operation_at],
            expires_at: transaction_params[:expires_at],
            type: transaction_params[:type]
          }
        end

        def transactions
          @transactions ||= fetch_transactions
        end

        def fetch_transactions
          transactions = Transaction.all
          transactions
        end

        def transaction
          @transaction ||= Transaction.find(params[:id])
        end

        def include_params
          ["**"]
        end
    end
  end
end
