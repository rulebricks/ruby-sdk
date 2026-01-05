# frozen_string_literal: true

module Rulebricks
  module Assets
    module Types
      module ImportManifestRequestConflictStrategy
        extend Rulebricks::Internal::Types::Enum

        UPDATE = "update"
        SKIP = "skip"
        ERROR = "error"
      end
    end
  end
end
