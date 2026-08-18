# frozen_string_literal: true

module Rulebricks
  module Types
    # Config for node type: ifelse. Continue If gating condition; evaluated against the single wired input.
    class RulebricksFlowNodeCondition < Internal::Types::Model
      field :property, -> { String }, optional: true, nullable: false

      field :operator, -> { String }, optional: true, nullable: false

      field :args, -> { Internal::Types::Array[Object] }, optional: true, nullable: false
    end
  end
end
