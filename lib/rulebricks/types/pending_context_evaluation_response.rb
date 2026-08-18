# frozen_string_literal: true

module Rulebricks
  module Types
    # Returned with HTTP 202 when a rule or flow cannot run yet because required facts are missing. The evaluation is
    # registered and fires automatically when the instance receives the missing facts (visible under the instance's
    # /pending endpoint until then).
    class PendingContextEvaluationResponse < Internal::Types::Model
      field :status, -> { Rulebricks::Types::PendingContextEvaluationResponseStatus }, optional: true, nullable: false

      field :context, -> { String }, optional: true, nullable: false

      field :rule, -> { String }, optional: true, nullable: false

      field :flow, -> { String }, optional: true, nullable: false

      field :have, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :need, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :waiting_on, -> { Internal::Types::Array[Rulebricks::Types::ContextWaitingOn] }, optional: true, nullable: false

      field :expires_at, -> { String }, optional: true, nullable: false
    end
  end
end
