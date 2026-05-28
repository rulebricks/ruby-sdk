# frozen_string_literal: true

module Rulebricks
  module Types
    # Base properties for a context.
    class ContextBase < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :slug, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :auto_execute_decisions, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :ttl_seconds, -> { Integer }, optional: true, nullable: false

      field :history_limit, -> { Integer }, optional: true, nullable: false

      field :on_schema_mismatch, -> { Rulebricks::Types::ContextBaseOnSchemaMismatch }, optional: true, nullable: false

      field :webhook_on_solve, -> { String }, optional: true, nullable: false

      field :webhook_on_expire, -> { String }, optional: true, nullable: false
    end
  end
end
