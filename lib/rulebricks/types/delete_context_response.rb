# frozen_string_literal: true

module Rulebricks
  module Types
    # Response after deleting a context.
    class DeleteContextResponse < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false

      field :unbound_rules, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :unbound_flows, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :pending_evaluations_cancelled, -> { Integer }, optional: true, nullable: false
    end
  end
end
