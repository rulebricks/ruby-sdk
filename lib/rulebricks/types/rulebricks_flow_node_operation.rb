# frozen_string_literal: true

module Rulebricks
  module Types
    module RulebricksFlowNodeOperation
      extend Rulebricks::Internal::Types::Enum

      READ = "read"
      UPDATE = "update"
      DELETE = "delete"
      BATCH_UPDATE = "batch_update"
    end
  end
end
