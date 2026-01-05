# frozen_string_literal: true

module Rulebricks
  module Types
    class FlowDetail < Internal::Types::Model
      field :published, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :origin_rule, -> { Rulebricks::Types::FlowDetailOriginRule }, optional: true, nullable: false
      field :context, -> { Rulebricks::Types::FlowDetailContext }, optional: true, nullable: false
    end
  end
end
