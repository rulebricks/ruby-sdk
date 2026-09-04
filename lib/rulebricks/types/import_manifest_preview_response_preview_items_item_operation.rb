# frozen_string_literal: true

module Rulebricks
  module Types
    module ImportManifestPreviewResponsePreviewItemsItemOperation
      extend Rulebricks::Internal::Types::Enum

      CREATE = "create"
      REPLACE = "replace"
      REUSE = "reuse"
      OMIT = "omit"
      REJECT = "reject"
      BLOCKED = "blocked"
    end
  end
end
