# frozen_string_literal: true

module Rulebricks
  module Types
    # Summary of one dependent context re-evaluated through a relationship.
    class ContextCascadeSummary < Internal::Types::Model
      field :relation_type, -> { String }, optional: true, nullable: false

      field :foreign_key_field, -> { String }, optional: true, nullable: false

      field :failed_instance_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :rejected, -> { Integer }, optional: true, nullable: false

      field :context, -> { String }, optional: false, nullable: false

      field :relation, -> { String }, optional: false, nullable: false

      field :instances, -> { Integer }, optional: true, nullable: false

      field :executed, -> { Integer }, optional: true, nullable: false

      field :evaluation_errors, -> { Integer }, optional: true, nullable: false

      field :infrastructure_errors, -> { Integer }, optional: true, nullable: false

      field :skipped, -> { Integer }, optional: true, nullable: false

      field :execution_degraded, -> { String }, optional: true, nullable: false

      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
