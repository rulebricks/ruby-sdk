# frozen_string_literal: true

module Rulebricks
  module Types
    # An individual execution failure returned inline as an HTTP 200 result.
    class ExecutionErrorResult < Internal::Types::Model
      field :error, -> { String }, optional: false, nullable: false
    end
  end
end
