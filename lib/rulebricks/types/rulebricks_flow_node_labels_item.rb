# frozen_string_literal: true

module Rulebricks
  module Types
    class RulebricksFlowNodeLabelsItem < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :type, -> { Rulebricks::Types::RulebricksFlowNodeLabelsItemType }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
