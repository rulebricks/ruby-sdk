# frozen_string_literal: true

module Rulebricks
  module Types
    # Requires `content` and either `id` or `name`.
    class UpsertObjectRequest < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Object }
    end
  end
end
