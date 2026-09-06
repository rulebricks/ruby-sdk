# frozen_string_literal: true

module Rulebricks
  module Types
    # The rule-defined output or an inline execution-failure payload.
    class RuleExecutionResult < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Internal::Types::Hash[String, Object] }

      member -> { Rulebricks::Types::ExecutionErrorResult }
    end
  end
end
