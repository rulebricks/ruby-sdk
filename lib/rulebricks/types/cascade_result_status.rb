# frozen_string_literal: true

module Rulebricks
  module Types
    module CascadeResultStatus
      extend Rulebricks::Internal::Types::Enum

      SOLVED = "solved"
      ERROR = "error"
      PENDING = "pending"
      SKIPPED_ALREADY_RUN = "skipped_already_run"
      SKIPPED_IN_PROGRESS = "skipped_in_progress"
      EVALUATION_ERROR = "evaluation_error"
      INFRASTRUCTURE_ERROR = "infrastructure_error"
    end
  end
end
