# frozen_string_literal: true

module Rulebricks
  module Types
    # Result of an auto-executed or cascaded rule/flow evaluation.
    class CascadeResult < Internal::Types::Model
      field :context, -> { String }, optional: true, nullable: false
      field :rule, -> { String }, optional: true, nullable: false
      field :flow, -> { String }, optional: true, nullable: false
      field :status, -> { Rulebricks::Types::CascadeResultStatus }, optional: true, nullable: false
      field :result, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :auto_executed, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :written_to_context, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
