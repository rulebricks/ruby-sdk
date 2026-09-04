# frozen_string_literal: true

module Rulebricks
  module Types
    # Renames a field while preserving generated value IDs.
    class UpsertObjectRequestFieldRename < Internal::Types::Model
      field :from_key, -> { String }, optional: false, nullable: false

      field :to_key, -> { String }, optional: false, nullable: false
    end
  end
end
