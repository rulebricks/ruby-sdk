# frozen_string_literal: true

module Rulebricks
  module Types
    # HTTP 202: required facts are missing. The registered rule/flow runs when those facts arrive and remains visible
    # under `/pending` until then.
    class PendingContextEvaluationResponse < Internal::Types::Model
      field :status, -> { Rulebricks::Types::PendingContextEvaluationResponseStatus }, optional: false, nullable: false

      field :context, -> { String }, optional: false, nullable: false

      field :rule, -> { String }, optional: true, nullable: false

      field :flow, -> { String }, optional: true, nullable: false

      field :have, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :need, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :waiting_on, -> { Internal::Types::Array[Rulebricks::Types::ContextWaitingOn] }, optional: true, nullable: false

      field :expires_at, -> { String }, optional: true, nullable: false
    end
  end
end
