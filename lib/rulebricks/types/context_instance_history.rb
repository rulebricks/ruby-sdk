# frozen_string_literal: true

module Rulebricks
  module Types
    # Historical values for context instance fields.
    class ContextInstanceHistory < Internal::Types::Model
      field :context, -> { String }, optional: true, nullable: false

      field :history, -> { Internal::Types::Hash[String, Internal::Types::Array[Rulebricks::Types::ContextInstanceHistoryEntry]] }, optional: true, nullable: false
    end
  end
end
