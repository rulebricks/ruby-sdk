# frozen_string_literal: true

module Rulebricks
  module Types
    module SchemaFieldType
      extend Rulebricks::Internal::Types::Enum

      STRING = "string"
      NUMBER = "number"
      BOOLEAN = "boolean"
      OBJECT = "object"
      ARRAY = "array"
    end
  end
end
