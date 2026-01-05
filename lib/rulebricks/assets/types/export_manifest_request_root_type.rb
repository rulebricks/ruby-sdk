# frozen_string_literal: true

module Rulebricks
  module Assets
    module Types
      module ExportManifestRequestRootType
        extend Rulebricks::Internal::Types::Enum

        RULE = "rule"
        FLOW = "flow"
        CONTEXT = "context"
        VALUE = "value"
      end
    end
  end
end
