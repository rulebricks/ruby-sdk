# frozen_string_literal: true

module Rulebricks
  module Types
    # A workspace object: a JSON Schema that is the source of truth for the system-managed vocabulary values generated
    # from its enums.
    class WorkspaceObject < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :content, -> { String }, optional: false, nullable: false

      field :schema_type, -> { String }, optional: true, nullable: false

      field :source_format, -> { String }, optional: true, nullable: false

      field :parsed_fields, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false

      field :user_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :archived_at, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
