# frozen_string_literal: true

module Rulebricks
  module Types
    class TestTestStateConditionsItemValue < Internal::Types::Model
      field :result, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :err, -> { String }, optional: true, nullable: false
    end
  end
end
