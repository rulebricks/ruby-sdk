# frozen_string_literal: true

module Rulebricks
  module Types
    # References another value by name (`$ref`) or ID (`$rb`).
    class ValueReference < Internal::Types::Model
      field :ref, -> { String }, optional: true, nullable: false, api_name: "$ref"

      field :rb, -> { Rulebricks::Types::ValueReferenceRb }, optional: true, nullable: false, api_name: "$rb"

      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
