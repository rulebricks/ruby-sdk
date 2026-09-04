# frozen_string_literal: true

module Rulebricks
  module Flows
    module Types
      class ExecuteFlowsRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false

        field :version, -> { String }, optional: false, nullable: false

        field :body, -> { Rulebricks::Types::FlowExecutionRequestPayload }, optional: false, nullable: false
      end
    end
  end
end
