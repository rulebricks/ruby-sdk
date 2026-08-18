# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextBatchResponseResultsItemExecutedItem < Internal::Types::Model
      field :type, -> { Rulebricks::Types::ContextBatchResponseResultsItemExecutedItemType }, optional: true, nullable: false

      field :slug, -> { String }, optional: true, nullable: false

      field :status, -> { Rulebricks::Types::ContextBatchResponseResultsItemExecutedItemStatus }, optional: true, nullable: false

      field :error, -> { String }, optional: true, nullable: false

      field :written_to_context, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
