# frozen_string_literal: true

module Rulebricks
  module Types
    # HTTP 200 execution result or HTTP 202 pending registration.
    class ContextFlowOutcome < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Rulebricks::Types::SolveContextFlowResponse }

      member -> { Rulebricks::Types::PendingContextEvaluationResponse }
    end
  end
end
