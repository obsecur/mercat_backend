# frozen_string_literal: true

module V1
  module Api
    class BooksController < ApiController
      def index
        render json: books, each_serializer: IndexBookSerializer, status: :ok
      end

      def create
        book_created = Book.new(book_params)

        if book_created.save
          render json: book_created, include: include_params, serializer: BookSerializer, status: :created
        else
          render_errors_for(book_created)
        end
      end

      def update
        if book.update(book_params)
          render json: book, serializer: BookSerializer, status: :ok
        else
          render_errors_for(book)
        end
      end

      def show
        render json: book, serializer: BookSerializer, status: :ok
      end

      def destroy
        if book.present?
          book.destroy
        end

        head :no_content
      end

      private
        def book_params
          params.require(:book)
                .permit(
                  :publication_at,
                  :status,
                  :author_name,
                  :status,
                  :title,
                  :isbn_code
                )
        end

        def books
          @books ||= fetch_books
        end

        def fetch_books
          books = Book.all
          books
        end

        def book
          @book ||= Book.find(params[:id])
        end

        def include_params
          ["**"]
        end
    end
  end
end
