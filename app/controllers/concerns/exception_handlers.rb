# frozen_string_literal: true

module ExceptionHandlers
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::ParameterMissing, with: :render_parameter_missing
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveModel::ValidationError, with: :render_model_errors
    rescue_from BaseCommand::ExecutionError, with: :render_execution_errors

    private
      def render_unprocessable_entity(exception)
        render json: { errors: exception.record.errors }, status: :unprocessable_entity
      end

      def render_not_found(exception)
        render json: { error: exception.message }, status: :not_found
      end

      def render_parameter_missing(exception)
        render json: { error: exception.message }, status: :bad_request
      end

      def render_errors_for(resource)
        render json: { errors: resource.errors }, status: :unprocessable_entity
      end

      def render_model_errors(invalid)
        render json: { errors: invalid.model.errors.messages }, status: :unprocessable_entity
      end

      def render_execution_errors(exception)
        render json: { errors: exception.command.errors.messages }, status: :unprocessable_entity
      end
  end
end
