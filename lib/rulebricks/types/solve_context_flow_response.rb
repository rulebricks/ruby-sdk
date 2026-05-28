# frozen_string_literal: true

module Rulebricks
  module Types
    # Response after executing a flow against a context instance.
    class SolveContextFlowResponse < Internal::Types::Model
      field :status, -> { Rulebricks::Types::SolveContextFlowResponseStatus }, optional: true, nullable: false

      field :context, -> { String }, optional: true, nullable: false

      field :flow, -> { String }, optional: true, nullable: false

      field :result, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :usage, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
