# frozen_string_literal: true

module Rulebricks
  module Types
    module ContextDerivedFieldType
      extend Rulebricks::Internal::Types::Enum

      STRING = "string"
      NUMBER = "number"
      BOOLEAN = "boolean"
      LIST = "list"
      DATE = "date"
    end
  end
end
