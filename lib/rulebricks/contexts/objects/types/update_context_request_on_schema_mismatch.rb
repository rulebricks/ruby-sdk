# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Objects
      module Types
        module UpdateContextRequestOnSchemaMismatch
          extend Rulebricks::Internal::Types::Enum

          IGNORE = "ignore"
          REJECT = "reject"
        end
      end
    end
  end
end
