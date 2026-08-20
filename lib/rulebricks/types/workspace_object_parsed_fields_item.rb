# frozen_string_literal: true

module Rulebricks
  module Types
    class WorkspaceObjectParsedFieldsItem < Internal::Types::Model
      field :key, -> { String }, optional: true, nullable: false

      field :scope, -> { String }, optional: true, nullable: false

      field :schema_path, -> { String }, optional: true, nullable: false, api_name: "schemaPath"

      field :derived_object_name, -> { String }, optional: true, nullable: false, api_name: "derivedObjectName"
    end
  end
end
