# frozen_string_literal: true

module Rulebricks
  module Types
    module ContextBatchResponseResultsItemReason
      extend Rulebricks::Internal::Types::Enum

      NOT_READY = "not_ready"
      INPUTS_UNCHANGED = "inputs_unchanged"
      NO_BOUND_ASSETS = "no_bound_assets"
      AUTO_EXECUTE_DISABLED = "auto_execute_disabled"
      EXECUTION_UNAVAILABLE = "execution_unavailable"
      EXECUTION_IN_PROGRESS = "execution_in_progress"
    end
  end
end
