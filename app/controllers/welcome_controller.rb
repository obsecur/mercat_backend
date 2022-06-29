# frozen_string_literal: true

class WelcomeController < ApplicationController
  def show
    render json: { message: "Welcome to Mercat API" }
  end
end
