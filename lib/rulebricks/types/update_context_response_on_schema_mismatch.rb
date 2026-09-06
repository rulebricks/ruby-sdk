# frozen_string_literal: true

module Rulebricks
  module Types
    module UpdateContextResponseOnSchemaMismatch
      extend Rulebricks::Internal::Types::Enum

      IGNORE = "ignore"
      REJECT = "reject"
      STORE = "store"
    end
  end
end
