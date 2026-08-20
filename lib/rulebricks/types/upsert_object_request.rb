# frozen_string_literal: true

module Rulebricks
  module Types
    # `content` is always required, together with at least one of `id` or `name`. Supplying both updates the object
    # selected by `id` and may change its display name.
    class UpsertObjectRequest < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Object }
    end
  end
end
