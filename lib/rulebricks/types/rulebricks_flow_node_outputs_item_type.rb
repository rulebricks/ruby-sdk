# frozen_string_literal: true

module Rulebricks
  module Types
    module RulebricksFlowNodeOutputsItemType
      extend Rulebricks::Internal::Types::Enum

      STRING = "string"
      NUMBER = "number"
      BOOLEAN = "boolean"
      LIST = "list"
      OBJECT = "object"
      DATE = "date"
      ANY = "any"
    end
  end
end
