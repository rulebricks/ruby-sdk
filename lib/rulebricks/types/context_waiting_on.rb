# frozen_string_literal: true

module Rulebricks
  module Types
    # A pending dependency. Fact dependencies identify the context instance and missing fields; relationship
    # dependencies also include the relationship name and derived facts that depend on it.
    class ContextWaitingOn < Internal::Types::Model
      field :context, -> { String }, optional: true, nullable: false

      field :instance, -> { String }, optional: true, nullable: false

      field :fields, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :relation, -> { String }, optional: true, nullable: false

      field :dependent_derived_fields, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "dependentDerivedFields"
    end
  end
end
