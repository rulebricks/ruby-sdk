# frozen_string_literal: true

module Rulebricks
  module Types
    # A pending rule or flow evaluation awaiting data.
    class ContextInstancePendingEvaluation < Internal::Types::Model
      field :type, -> { Rulebricks::Types::ContextInstancePendingEvaluationType }, optional: true, nullable: false
      field :rule, -> { String }, optional: true, nullable: false
      field :rule_id, -> { String }, optional: true, nullable: false
      field :flow, -> { String }, optional: true, nullable: false
      field :flow_id, -> { String }, optional: true, nullable: false
      field :waiting_on, -> { Internal::Types::Array[Rulebricks::Types::ContextInstancePendingEvaluationWaitingOnItem] }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :expires_at, -> { String }, optional: true, nullable: false
    end
  end
end
