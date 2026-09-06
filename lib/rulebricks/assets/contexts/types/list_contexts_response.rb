# frozen_string_literal: true

module Rulebricks
  module Assets
    module Contexts
      module Types
        class ListContextsResponse < Internal::Types::Model
          extend Rulebricks::Internal::Types::Union

          member -> { Internal::Types::Array[Rulebricks::Types::ContextListItem] }

          member -> { Rulebricks::Types::ContextListPage }
        end
      end
    end
  end
end
