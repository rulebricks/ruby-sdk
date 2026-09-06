# frozen_string_literal: true

module Rulebricks
  module Types
    # Response from a context batch: admission counts, per-record rejections, execution outcomes, and the resolved state
    # of every touched instance.
    class ContextBatchResponse < Internal::Types::Model
      field :cascade_rejections, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false

      field :context, -> { String }, optional: true, nullable: false

      field :trace_id, -> { String }, optional: true, nullable: false

      field :accepted, -> { Integer }, optional: true, nullable: false

      field :rejected, -> { Integer }, optional: true, nullable: false

      field :executed, -> { Integer }, optional: true, nullable: false

      field :execution_degraded, -> { String }, optional: true, nullable: false

      field :cascaded, -> { Internal::Types::Array[Rulebricks::Types::ContextCascadeSummary] }, optional: true, nullable: false

      field :timings, -> { Rulebricks::Types::ContextBatchResponseTimings }, optional: true, nullable: false

      field :rejections, -> { Internal::Types::Array[Rulebricks::Types::ContextBatchResponseRejectionsItem] }, optional: true, nullable: false

      field :results, -> { Internal::Types::Array[Rulebricks::Types::ContextBatchResponseResultsItem] }, optional: true, nullable: false
    end
  end
end
