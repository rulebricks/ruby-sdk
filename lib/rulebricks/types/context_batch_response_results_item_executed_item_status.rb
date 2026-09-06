# frozen_string_literal: true

module Rulebricks
  module Types
    module ContextBatchResponseResultsItemExecutedItemStatus
      extend Rulebricks::Internal::Types::Enum

      SUCCESS = "success"
      EVALUATION_ERROR = "evaluation_error"
      INFRASTRUCTURE_ERROR = "infrastructure_error"
      SKIPPED_ALREADY_RUN = "skipped_already_run"
      SKIPPED_IN_PROGRESS = "skipped_in_progress"
    end
  end
end
