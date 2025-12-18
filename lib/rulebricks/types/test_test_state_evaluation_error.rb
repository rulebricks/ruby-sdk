# frozen_string_literal: true

module Rulebricks
  module Types
    # Error message or flag indicating if evaluation error occurred
    class TestTestStateEvaluationError < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Internal::Types::Boolean }
      member -> { String }
    end
  end
end
