# frozen_string_literal: true

module Rulebricks
  module Types
    class CascadeContextResponseCascadedItem < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Rulebricks::Types::CascadeResult }

      member -> { Rulebricks::Types::ContextCascadeSummary }
    end
  end
end
