# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextRelationshipIncoming < Internal::Types::Model
      field :source_context, -> { Rulebricks::Types::ContextRelationshipIncomingSourceContext }, optional: true, nullable: false
    end
  end
end
