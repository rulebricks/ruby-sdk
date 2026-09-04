# frozen_string_literal: true

module Rulebricks
  module Types
    class RunTestsResponseFailuresItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :policy, -> { Rulebricks::Types::RunTestsResponseFailuresItemPolicy }, optional: false, nullable: false

      field :critical, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :expected, -> { Object }, optional: false, nullable: true

      field :actual, -> { Object }, optional: false, nullable: true

      field :matched_rows, -> { Internal::Types::Array[Integer] }, optional: true, nullable: false

      field :error_message, -> { String }, optional: true, nullable: false
    end
  end
end
