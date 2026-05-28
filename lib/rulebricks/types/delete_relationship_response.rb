# frozen_string_literal: true

module Rulebricks
  module Types
    class DeleteRelationshipResponse < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false

      field :id, -> { String }, optional: true, nullable: false
    end
  end
end
