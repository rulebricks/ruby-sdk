# frozen_string_literal: true

module Rulebricks
  module Types
    class RulebricksFlowNodeTableItem < Internal::Types::Model
      field :key, -> { Object }, optional: false, nullable: false

      field :value, -> { Object }, optional: false, nullable: false
    end
  end
end
