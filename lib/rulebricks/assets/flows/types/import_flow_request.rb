# frozen_string_literal: true

module Rulebricks
  module Assets
    module Flows
      module Types
        class ImportFlowRequest < Internal::Types::Model
          field :flow, -> { Rulebricks::Types::FlowImportPayload }, optional: false, nullable: false
        end
      end
    end
  end
end
