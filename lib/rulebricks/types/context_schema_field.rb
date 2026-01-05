# frozen_string_literal: true

module Rulebricks
  module Types
    # A field definition within a context schema.
    class ContextSchemaField < Internal::Types::Model
      field :key, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :type, -> { Rulebricks::Types::ContextSchemaFieldType }, optional: true, nullable: false
      field :default_value, -> { Object }, optional: true, nullable: false
      field :derived, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :source_rule, -> { String }, optional: true, nullable: false
      field :source_flow, -> { String }, optional: true, nullable: false
      field :source_field, -> { String }, optional: true, nullable: false
    end
  end
end
