# frozen_string_literal: true

module Rulebricks
  module Types
    # Response after solving a rule against a context instance.
    class SolveContextRuleResponse < Internal::Types::Model
      field :status, -> { Rulebricks::Types::SolveContextRuleResponseStatus }, optional: true, nullable: false
      field :context, -> { String }, optional: true, nullable: false
      field :rule, -> { String }, optional: true, nullable: false
      field :result, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :written_to_context, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :cascaded, -> { Internal::Types::Array[Rulebricks::Types::CascadeResult] }, optional: true, nullable: false
    end
  end
end
