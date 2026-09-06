# frozen_string_literal: true

module Rulebricks
  module Types
    module CreateContextResponseOnSchemaMismatch
      extend Rulebricks::Internal::Types::Enum

      IGNORE = "ignore"
      REJECT = "reject"
      STORE = "store"
    end
  end
end
