# frozen_string_literal: true

module Rulebricks
  module Types
    # A single flow output object or an array of output objects for bulk execution.
    class FlowExecutionResponsePayload < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Internal::Types::Hash[String, Object] }

      member -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }
    end
  end
end
