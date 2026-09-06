# frozen_string_literal: true

module Rulebricks
  module Types
    # Response after deleting a context instance.
    class DeleteContextInstanceResponse < Internal::Types::Model
      field :execution_degraded, -> { String }, optional: true, nullable: false

      field :cascaded, -> { Internal::Types::Array[Rulebricks::Types::ContextCascadeSummary] }, optional: true, nullable: false

      field :cascade_recovery, -> { Rulebricks::Types::DeleteContextInstanceResponseCascadeRecovery }, optional: true, nullable: false

      field :message, -> { String }, optional: true, nullable: false

      field :pending_evaluations_cancelled, -> { Integer }, optional: true, nullable: false
    end
  end
end
