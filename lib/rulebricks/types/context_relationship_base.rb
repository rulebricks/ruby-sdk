# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextRelationshipBase < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :type, -> { Rulebricks::Types::ContextRelationshipBaseType }, optional: true, nullable: false

      field :foreign_key, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
