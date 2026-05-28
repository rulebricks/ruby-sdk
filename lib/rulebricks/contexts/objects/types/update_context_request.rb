# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Objects
      module Types
        class UpdateContextRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :name, -> { String }, optional: true, nullable: false

          field :slug, -> { String }, optional: true, nullable: false

          field :description, -> { String }, optional: true, nullable: false

          field :schema, -> { Internal::Types::Array[Rulebricks::Contexts::Objects::Types::UpdateContextRequestSchemaItem] }, optional: true, nullable: false

          field :auto_execute_decisions, -> { Internal::Types::Boolean }, optional: true, nullable: false

          field :ttl_seconds, -> { Integer }, optional: true, nullable: false

          field :history_limit, -> { Integer }, optional: true, nullable: false

          field :on_schema_mismatch, -> { Rulebricks::Contexts::Objects::Types::UpdateContextRequestOnSchemaMismatch }, optional: true, nullable: false

          field :webhook_on_solve, -> { String }, optional: true, nullable: false

          field :webhook_on_expire, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
