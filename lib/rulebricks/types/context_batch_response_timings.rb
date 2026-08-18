# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextBatchResponseTimings < Internal::Types::Model
      field :total_ms, -> { Integer }, optional: true, nullable: false

      field :ingest_ms, -> { Integer }, optional: true, nullable: false
    end
  end
end
