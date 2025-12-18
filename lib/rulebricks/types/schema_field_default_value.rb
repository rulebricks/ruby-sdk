# frozen_string_literal: true

module Rulebricks
  module Types
    # Default value for this field.
    class SchemaFieldDefaultValue < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { String }
      member -> { Integer }
      member -> { Internal::Types::Boolean }
      member -> { Internal::Types::Hash[String, Object] }
      member -> { Internal::Types::Array[Object] }
    end
  end
end
