# frozen_string_literal: true

module BaseCommand
  class ExecutionError < StandardError
    attr_reader :command

    def initialize(command)
      @command = command
    end
  end

  Unimplemented = Class.new(StandardError)

  attr_reader :result

  module ClassMethods
    def call(*args, **kwargs)
      command = new(*args, **kwargs)
      command.call
      command
    end
  end

  def self.prepended(base)
    base.extend ClassMethods
    base.send(:include, ActiveModel::Model)
  end

  def call
    fail Unimplemented, "You must implement #call" unless defined?(super)

    validate!

    @result = super

    errors.empty? || raise(ExecutionError.new(self))
  end
end
