# frozen_string_literal: true

module V1
  module Api
    class UsersController < ApiController
      def index
        render json: users, each_serializer: IndexUserSerializer, status: :ok
      end

      def create
        user_created = User.new(user_params)

        if user_created.save
          render json: user_created, include: include_params, serializer: UserSerializer, status: :created
        else
          render_errors_for(user_created)
        end
      end

      def update
        if user.update(user_params)
          render json: user, serializer: UserSerializer, status: :ok
        else
          render_errors_for(user)
        end
      end

      def show
        render json: user, serializer: UserSerializer, status: :ok
      end

      def destroy
        if user.present?
          user.destroy
        end

        head :no_content
      end

      private
        def user_params
          params.require(:user)
                .permit(
                  :name,
                  :email,
                  :phone,
                  address_attributes: [:id, :city, :country, :latitude, :longitude, :street, :street_number, :zipcode]
                )
        end

        def users
          @users ||= fetch_users
        end

        def fetch_users
          users = User.all
          users
        end

        def user
          @user ||= User.find(params[:id])
        end

        def include_params
          ["**"]
        end
    end
  end
end
