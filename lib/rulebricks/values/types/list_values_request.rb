# frozen_string_literal: true

module Rulebricks
  module Values
    module Types
      class ListValuesRequest < Internal::Types::Model
        field :name, -> { String }, optional: true, nullable: false

        field :prefix, -> { String }, optional: true, nullable: false

        field :type, -> { String }, optional: true, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false

        field :user_group, -> { String }, optional: true, nullable: false

        field :include, -> { String }, optional: true, nullable: false

        field :resolve, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
