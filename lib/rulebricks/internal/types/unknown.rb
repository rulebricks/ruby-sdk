# frozen_string_literal: true

module Rulebricks
  module Internal
    module Types
      module Unknown
        include Rulebricks::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
