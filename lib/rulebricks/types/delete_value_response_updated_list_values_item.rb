# frozen_string_literal: true

module Rulebricks
  module Types
    class DeleteValueResponseUpdatedListValuesItem < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
