# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Types
      class GetPendingContextsRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false
        field :instance, -> { String }, optional: false, nullable: false
      end
    end
  end
end
