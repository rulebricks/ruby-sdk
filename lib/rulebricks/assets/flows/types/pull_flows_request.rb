# frozen_string_literal: true

module Rulebricks
  module Assets
    module Flows
      module Types
        class PullFlowsRequest < Internal::Types::Model
          field :id, -> { String }, optional: true, nullable: false

          field :slug, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
