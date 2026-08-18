# frozen_string_literal: true

module Rulebricks
  module Values
    module Types
      class ListValuesResponse < Internal::Types::Model
        extend Rulebricks::Internal::Types::Union

        member -> { Internal::Types::Array[Rulebricks::Types::DynamicValue] }

        member -> { Rulebricks::Types::DynamicValuePage }
      end
    end
  end
end
