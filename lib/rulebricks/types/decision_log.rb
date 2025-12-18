# frozen_string_literal: true

module Rulebricks
  module Types
    # Rule/flow execution log entry with request, response, and decision details.
    class DecisionLog < Internal::Types::Model
      field :timestamp, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :endpoint, -> { String }, optional: true, nullable: false
      field :status, -> { Integer }, optional: true, nullable: false
      field :request, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :response, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :decision, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :error, -> { String }, optional: true, nullable: false
      field :abbreviated, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
