# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextInstancePendingEvaluationWaitingOnItem < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { String }

      member -> { Rulebricks::Types::ContextInstancePendingEvaluationWaitingOnItemField }
    end
  end
end
