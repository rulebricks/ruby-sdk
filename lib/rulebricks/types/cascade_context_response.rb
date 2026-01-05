# frozen_string_literal: true

module Rulebricks
  module Types
    # Response after triggering a cascade re-evaluation of pending rules/flows.
    class CascadeContextResponse < Internal::Types::Model
      field :context, -> { String }, optional: true, nullable: false
      field :cascaded, -> { Internal::Types::Array[Rulebricks::Types::CascadeResult] }, optional: true, nullable: false
    end
  end
end
