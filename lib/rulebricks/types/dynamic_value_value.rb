# frozen_string_literal: true

module Rulebricks
  module Types
    # The actual value - can be any valid JSON type. Materialized by default when the payload contains value-to-value
    # references; with resolve=false the stored payload is returned as-is, with ValueReference markers intact.
    class DynamicValueValue < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { String }

      member -> { Integer }

      member -> { Internal::Types::Boolean }

      member -> { Internal::Types::Array[Object] }

      member -> { Internal::Types::Hash[String, Object] }
    end
  end
end
