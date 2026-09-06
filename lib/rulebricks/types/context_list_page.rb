# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextListPage < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Rulebricks::Types::ContextListItem] }, optional: false, nullable: false

      field :cursor, -> { String }, optional: false, nullable: true
    end
  end
end
