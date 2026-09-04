# frozen_string_literal: true

module Rulebricks
  module Assets
    module Contexts
      module Types
        module UpdateContextRequestOnSchemaMismatch
          extend Rulebricks::Internal::Types::Enum

          IGNORE = "ignore"
          REJECT = "reject"
          STORE = "store"
        end
      end
    end
  end
end
