# frozen_string_literal: true

module Rulebricks
  module Objects
    module Types
      class UpsertObjectRequest < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :content, -> { String }, optional: false, nullable: false

        field :user_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :dry_run, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :expected_updated_at, -> { String }, optional: true, nullable: false
      end
    end
  end
end
