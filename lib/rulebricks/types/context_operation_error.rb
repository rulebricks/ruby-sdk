# frozen_string_literal: true

module Rulebricks
  module Types
    # A Context operation failed. Earlier chunks can already be committed. Omitted committed IDs do not prove that no
    # write occurred when the outcome is uncertain.
    class ContextOperationError < Internal::Types::Model
      field :error, -> { String }, optional: false, nullable: false

      field :committed_count, -> { Integer }, optional: true, nullable: false

      field :committed_instance_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :failed_instance_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
