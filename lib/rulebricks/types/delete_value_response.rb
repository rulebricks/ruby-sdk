# frozen_string_literal: true

module Rulebricks
  module Types
    # Result of deleting a vocabulary value, including value-to-value reference effects.
    class DeleteValueResponse < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false

      field :cascade_deleted, -> { Internal::Types::Array[Rulebricks::Types::DeleteValueResponseCascadeDeletedItem] }, optional: true, nullable: false

      field :updated_list_values, -> { Internal::Types::Array[Rulebricks::Types::DeleteValueResponseUpdatedListValuesItem] }, optional: true, nullable: false
    end
  end
end
