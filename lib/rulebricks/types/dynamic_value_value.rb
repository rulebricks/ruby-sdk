# frozen_string_literal: true

module Rulebricks
  module Types
    # The actual value - can be any valid JSON type
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
