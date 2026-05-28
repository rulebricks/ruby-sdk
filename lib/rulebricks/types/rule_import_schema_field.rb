# frozen_string_literal: true

module Rulebricks
  module Types
    # A request or response schema field used when importing a rule.
    class RuleImportSchemaField < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :show, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :type, -> { Rulebricks::Types::RuleImportSchemaFieldType }, optional: false, nullable: false

      field :default_value, -> { Object }, optional: true, nullable: false, api_name: "defaultValue"

      field :values_only, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "valuesOnly"

      field :values_prefix, -> { String }, optional: true, nullable: false, api_name: "valuesPrefix"
    end
  end
end
