# frozen_string_literal: true

module Rulebricks
  module Types
    module ContextBaseOnSchemaMismatch
      extend Rulebricks::Internal::Types::Enum

      IGNORE = "ignore"
      REJECT = "reject"
    end
  end
end
