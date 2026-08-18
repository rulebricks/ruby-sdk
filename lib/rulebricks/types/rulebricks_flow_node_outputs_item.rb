# frozen_string_literal: true

module Rulebricks
  module Types
    class RulebricksFlowNodeOutputsItem < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :type, -> { Rulebricks::Types::RulebricksFlowNodeOutputsItemType }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
