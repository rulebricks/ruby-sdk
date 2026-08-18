# frozen_string_literal: true

module Rulebricks
  module Types
    # Paginated values envelope, returned when 'limit' or 'cursor' is provided. Ordered by name.
    class DynamicValuePage < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Rulebricks::Types::DynamicValue] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: true, nullable: false

      field :total, -> { Integer }, optional: true, nullable: false

      field :total_is_estimate, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
