# frozen_string_literal: true

module Rulebricks
  module Types
    class SchemaField < Internal::Types::Model
      field :key, -> { String }, optional: true, nullable: false
      field :show, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :type, -> { Rulebricks::Types::SchemaFieldType }, optional: true, nullable: false
      field :default_value, -> { Rulebricks::Types::SchemaFieldDefaultValue }, optional: true, nullable: false, api_name: "defaultValue"
      field :default_computed_value, -> { String }, optional: true, nullable: false, api_name: "defaultComputedValue"
      field :transform, -> { String }, optional: true, nullable: false
    end
  end
end
