# frozen_string_literal: true

module Rulebricks
  module Assets
    module Folders
      module Types
        module UpsertFolderRequestType
          extend Rulebricks::Internal::Types::Enum

          RULE = "rule"
          FLOW = "flow"
          CONTEXT = "context"
        end
      end
    end
  end
end
