# frozen_string_literal: true

module Rulebricks
  module Types
    # A single history entry for a field value.
    class ContextInstanceHistoryEntry < Internal::Types::Model
      field :timestamp, -> { String }, optional: true, nullable: false

      field :value, -> { Object }, optional: true, nullable: false
    end
  end
end
