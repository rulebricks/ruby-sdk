# frozen_string_literal: true

module Rulebricks
  module Types
    # JSON Schema object or serialized JSON string. Enums become managed values.
    class UpsertObjectRequestContent < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { String }

      member -> { Internal::Types::Hash[String, Object] }
    end
  end
end
