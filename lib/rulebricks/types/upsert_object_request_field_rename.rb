# frozen_string_literal: true

module Rulebricks
  module Types
    # Optional single-field rename hint for an update. When `content` replaces an existing schema field key with a new
    # key, this hint preserves matching managed enum value IDs instead of archiving and recreating them.
    class UpsertObjectRequestFieldRename < Internal::Types::Model
      field :from_key, -> { String }, optional: false, nullable: false

      field :to_key, -> { String }, optional: false, nullable: false
    end
  end
end
