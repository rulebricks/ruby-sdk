# frozen_string_literal: true

module Rulebricks
  module Types
    module ContextSchemaFieldType
      extend Rulebricks::Internal::Types::Enum

      STRING = "string"
      NUMBER = "number"
      BOOLEAN = "boolean"
      DATE = "date"
      LIST = "list"
      FUNCTION = "function"
    end
  end
end
