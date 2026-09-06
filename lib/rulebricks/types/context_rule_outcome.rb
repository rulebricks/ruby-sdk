# frozen_string_literal: true

module Rulebricks
  module Types
    # HTTP 200 execution result or HTTP 202 pending registration.
    class ContextRuleOutcome < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Rulebricks::Types::SolveContextRuleResponse }

      member -> { Rulebricks::Types::PendingContextEvaluationResponse }
    end
  end
end
