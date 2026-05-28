# frozen_string_literal: true

module Rulebricks
  module Types
    module RuleImportSchemaFieldType
      extend Rulebricks::Internal::Types::Enum

      STRING = "string"
      NUMBER = "number"
      BOOLEAN = "boolean"
      DATE = "date"
      LIST = "list"
      OBJECT = "object"
      FUNCTION = "function"
    end
  end
end
