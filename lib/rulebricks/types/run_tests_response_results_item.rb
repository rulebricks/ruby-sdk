# frozen_string_literal: true

module Rulebricks
  module Types
    class RunTestsResponseResultsItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :policy, -> { Rulebricks::Types::RunTestsResponseResultsItemPolicy }, optional: false, nullable: false

      field :critical, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :error, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
