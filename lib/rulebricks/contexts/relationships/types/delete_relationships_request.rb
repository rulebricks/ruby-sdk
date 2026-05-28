# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Relationships
      module Types
        class DeleteRelationshipsRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :relationship, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
