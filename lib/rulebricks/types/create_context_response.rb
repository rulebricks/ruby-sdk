# frozen_string_literal: true

module Rulebricks
  module Types
    # Summary of the newly created context.
    class CreateContextResponse < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :slug, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
