# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Relationships
      module Types
        class CreateRelationshipRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :to_context_id, -> { String }, optional: false, nullable: false
          field :relation_type, -> { Rulebricks::Contexts::Relationships::Types::CreateRelationshipRequestRelationType }, optional: false, nullable: false
          field :foreign_key_fact, -> { String }, optional: false, nullable: false
          field :name, -> { String }, optional: true, nullable: false
          field :description, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
