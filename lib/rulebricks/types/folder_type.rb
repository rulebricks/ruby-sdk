# frozen_string_literal: true

module Rulebricks
  module Types
    module FolderType
      extend Rulebricks::Internal::Types::Enum

      RULE = "rule"
      FLOW = "flow"
      CONTEXT = "context"
    end
  end
end
