# frozen_string_literal: true

module Rulebricks
  module Types
    # A single flow input object or an array of input objects for bulk execution.
    class FlowExecutionRequestPayload < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Internal::Types::Hash[String, Object] }

      member -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }
    end
  end
end
