# frozen_string_literal: true

module Rulebricks
  module Types
    # A request cell in a condition row.
    class RuleImportRequestCell < Internal::Types::Model
      field :op, -> { String }, optional: false, nullable: false

      field :args, -> { Internal::Types::Array[Object] }, optional: false, nullable: false
    end
  end
end
