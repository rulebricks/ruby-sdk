# frozen_string_literal: true

module Rulebricks
  module Types
    # Result of deleting a vocabulary value.
    class DeleteValueResponse < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false

      field :updated_list_values, -> { Internal::Types::Array[Rulebricks::Types::DeleteValueResponseUpdatedListValuesItem] }, optional: true, nullable: false
    end
  end
end
