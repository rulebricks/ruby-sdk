# frozen_string_literal: true

module Rulebricks
  module Types
    # A value-to-value reference marker. On writes, reference a value by name with { "$ref": "<value name>" } or by ID
    # with { "$rb": "globalValue", "id": "<value id>" }. Name references are resolved and stored as ID references, so
    # renames never break them. A scalar payload may be a single reference; list payloads may mix literal items and
    # references. Reads with resolve=false return the stored id-based markers.
    class ValueReference < Internal::Types::Model
      field :ref, -> { String }, optional: true, nullable: false, api_name: "$ref"

      field :rb, -> { Rulebricks::Types::ValueReferenceRb }, optional: true, nullable: false, api_name: "$rb"

      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
