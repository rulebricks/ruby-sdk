# frozen_string_literal: true

module Rulebricks
  module Types
    # System limits for vocabulary values
    class ValueLimits < Internal::Types::Model
      field :max_keys, -> { Integer }, optional: true, nullable: false, api_name: "MAX_KEYS"

      field :max_value_length, -> { Integer }, optional: true, nullable: false, api_name: "MAX_VALUE_LENGTH"

      field :max_key_length, -> { Integer }, optional: true, nullable: false, api_name: "MAX_KEY_LENGTH"

      field :max_key_bytes, -> { Integer }, optional: true, nullable: false, api_name: "MAX_KEY_BYTES"
    end
  end
end
