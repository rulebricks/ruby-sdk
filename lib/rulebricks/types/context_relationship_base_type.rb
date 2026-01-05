# frozen_string_literal: true

module Rulebricks
  module Types
    module ContextRelationshipBaseType
      extend Rulebricks::Internal::Types::Enum

      HAS_MANY = "has_many"
      HAS_ONE = "has_one"
      BELONGS_TO = "belongs_to"
    end
  end
end
