# frozen_string_literal: true

module Rulebricks
  module Assets
    module Contexts
      module Types
        class UpdateContextRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :name, -> { String }, optional: true, nullable: false

          field :description, -> { String }, optional: true, nullable: false

          field :schema, -> { Rulebricks::Types::ContextSchema }, optional: true, nullable: false

          field :identity_fact, -> { String }, optional: true, nullable: false

          field :auto_execute_decisions, -> { Internal::Types::Boolean }, optional: true, nullable: false

          field :ttl_seconds, -> { Integer }, optional: true, nullable: false

          field :history_limit, -> { Integer }, optional: true, nullable: false

          field :on_schema_mismatch, -> { Rulebricks::Assets::Contexts::Types::UpdateContextRequestOnSchemaMismatch }, optional: true, nullable: false

          field :source_objects, -> { Internal::Types::Array[String] }, optional: true, nullable: false

          field :user_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false

          field :folder, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
