# frozen_string_literal: true

module Rulebricks
  module Types
    # System limits for dynamic values
    class ValueLimits < Internal::Types::Model
      field :max_keys, -> { Integer }, optional: true, nullable: false, api_name: "MAX_KEYS"
      field :max_value_length, -> { Integer }, optional: true, nullable: false, api_name: "MAX_VALUE_LENGTH"
      field :max_total_size, -> { Integer }, optional: true, nullable: false, api_name: "MAX_TOTAL_SIZE"
      field :max_key_length, -> { Integer }, optional: true, nullable: false, api_name: "MAX_KEY_LENGTH"
    end
  end
end
