# frozen_string_literal: true

module Rulebricks
  module Types
    module ImportManifestRequestConflictStrategy
      extend Rulebricks::Internal::Types::Enum

      OVERRIDE = "override"
      PRESERVE = "preserve"
      BLOCK = "block"
    end
  end
end
