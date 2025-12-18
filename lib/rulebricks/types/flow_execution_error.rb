# frozen_string_literal: true

module Rulebricks
  module Types
    # Error response when flow execution fails
    class FlowExecutionError < Internal::Types::Model
      field :error, -> { String }, optional: true, nullable: false
      field :node, -> { String }, optional: true, nullable: false
      field :details, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
