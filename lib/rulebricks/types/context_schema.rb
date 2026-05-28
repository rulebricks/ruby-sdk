# frozen_string_literal: true

module Rulebricks
  module Types
    # The schema definition for a context.
    class ContextSchema < Internal::Types::Model
      field :base, -> { Internal::Types::Array[Rulebricks::Types::ContextSchemaField] }, optional: true, nullable: false

      field :derived, -> { Internal::Types::Array[Rulebricks::Types::ContextSchemaField] }, optional: true, nullable: false
    end
  end
end
