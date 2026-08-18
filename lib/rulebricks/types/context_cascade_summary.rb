# frozen_string_literal: true

module Rulebricks
  module Types
    # Summary of one dependent context re-evaluated through a relationship.
    class ContextCascadeSummary < Internal::Types::Model
      field :context, -> { String }, optional: true, nullable: false

      field :relation, -> { String }, optional: true, nullable: false

      field :instances, -> { Integer }, optional: true, nullable: false

      field :executed, -> { Integer }, optional: true, nullable: false

      field :evaluation_errors, -> { Integer }, optional: true, nullable: false

      field :infrastructure_errors, -> { Integer }, optional: true, nullable: false

      field :skipped, -> { Integer }, optional: true, nullable: false

      field :truncated, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :execution_degraded, -> { String }, optional: true, nullable: false

      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
