# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextDetailBoundFlowsItem < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :slug, -> { String }, optional: true, nullable: false
      field :published, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :origin_rule, -> { Rulebricks::Types::ContextDetailBoundFlowsItemOriginRule }, optional: true, nullable: false
    end
  end
end
