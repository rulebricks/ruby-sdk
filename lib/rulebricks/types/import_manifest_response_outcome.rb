# frozen_string_literal: true

module Rulebricks
  module Types
    module ImportManifestResponseOutcome
      extend Rulebricks::Internal::Types::Enum

      COMPLETE = "complete"
      PARTIAL = "partial"
      REJECTED = "rejected"
    end
  end
end
