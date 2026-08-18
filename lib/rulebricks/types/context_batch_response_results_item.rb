# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextBatchResponseResultsItem < Internal::Types::Model
      field :instance_id, -> { String }, optional: true, nullable: false

      field :positions, -> { Internal::Types::Array[Integer] }, optional: true, nullable: false

      field :is_new, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :status, -> { Rulebricks::Types::ContextBatchResponseResultsItemStatus }, optional: true, nullable: false

      field :have, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :need, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :state, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :expires_at, -> { String }, optional: true, nullable: false

      field :executions, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :executed, -> { Internal::Types::Array[Rulebricks::Types::ContextBatchResponseResultsItemExecutedItem] }, optional: true, nullable: false

      field :triggered, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :reason, -> { Rulebricks::Types::ContextBatchResponseResultsItemReason }, optional: true, nullable: false
    end
  end
end
