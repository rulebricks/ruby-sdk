# frozen_string_literal: true

module Rulebricks
  module Values
    module Types
      class UpdateValuesResponse < Internal::Types::Model
        extend Rulebricks::Internal::Types::Union

        member -> { Internal::Types::Array[Rulebricks::Types::DynamicValue] }

        member -> { Rulebricks::Types::UpdateValuesSummaryResponse }
      end
    end
  end
end
