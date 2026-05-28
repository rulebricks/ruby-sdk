# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextRelationshipsResponse < Internal::Types::Model
      field :context, -> { Rulebricks::Types::ContextRelationshipsResponseContext }, optional: true, nullable: false

      field :outgoing, -> { Internal::Types::Array[Rulebricks::Types::ContextRelationshipOutgoing] }, optional: true, nullable: false

      field :incoming, -> { Internal::Types::Array[Rulebricks::Types::ContextRelationshipIncoming] }, optional: true, nullable: false
    end
  end
end
