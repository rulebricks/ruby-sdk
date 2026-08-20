# frozen_string_literal: true

module Rulebricks
  module Types
    class ObjectUpsertConflictResponse < Internal::Types::Model
      field :error, -> { String }, optional: false, nullable: false

      field :collisions, -> { Internal::Types::Array[Rulebricks::Types::ObjectValueCollision] }, optional: true, nullable: false
    end
  end
end
