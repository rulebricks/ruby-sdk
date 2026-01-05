# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextRelationshipOutgoing < Internal::Types::Model
      field :target_context, -> { Rulebricks::Types::ContextRelationshipOutgoingTargetContext }, optional: true, nullable: false
    end
  end
end
