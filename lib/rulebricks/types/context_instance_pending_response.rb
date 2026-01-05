# frozen_string_literal: true

module Rulebricks
  module Types
    # List of pending evaluations for a context instance.
    class ContextInstancePendingResponse < Internal::Types::Model
      field :pending, -> { Internal::Types::Array[Rulebricks::Types::ContextInstancePendingEvaluation] }, optional: true, nullable: false
    end
  end
end
