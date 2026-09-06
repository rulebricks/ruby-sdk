# frozen_string_literal: true

module Rulebricks
  module Types
    # For object input, one flow result. For list input, a same-length list with one result per input in input order.
    # Failed executions use ExecutionErrorResult and are never null.
    class FlowExecutionResponsePayload < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Rulebricks::Types::FlowExecutionResult }

      member -> { Internal::Types::Array[Rulebricks::Types::FlowExecutionResult] }
    end
  end
end
