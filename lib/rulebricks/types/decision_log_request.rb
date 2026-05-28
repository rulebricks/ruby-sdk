# frozen_string_literal: true

module Rulebricks
  module Types
    # The request payload sent to the rule/flow. Can be an object for single requests or an array for bulk operations.
    class DecisionLogRequest < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Internal::Types::Hash[String, Object] }

      member -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }
    end
  end
end
