# frozen_string_literal: true

module Rulebricks
  module Assets
    module Contexts
      module Types
        class DeleteContextsRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
