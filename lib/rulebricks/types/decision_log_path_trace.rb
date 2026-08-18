# frozen_string_literal: true

module Rulebricks
  module Types
    # Decompressed execution path trace for flow records: the executed steps with their inputs and outputs. An object
    # for single flow runs, or a null-aligned array (1:1 with the request array) for bulk runs. Only present when
    # `include_traces=true`; null for non-flow records, runs without a stored trace, and traces dropped by the size cap
    # (see the decision's `path_trace_omitted`).
    class DecisionLogPathTrace < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Internal::Types::Hash[String, Object] }

      member -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }
    end
  end
end
