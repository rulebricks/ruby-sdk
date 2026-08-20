# frozen_string_literal: true

module Rulebricks
  module Types
    class ObjectValueCollision < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :existing_id, -> { String }, optional: false, nullable: false, api_name: "existingId"
    end
  end
end
