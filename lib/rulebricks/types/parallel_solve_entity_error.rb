# frozen_string_literal: true

module Rulebricks
  module Types
    # Reported in a parallel-solve response slot when an individual rule or flow could not be executed. The reserved
    # `$error` key cannot collide with a rule/flow's own output fields.
    class ParallelSolveEntityError < Internal::Types::Model
      field :error, -> { Rulebricks::Types::ParallelSolveEntityErrorError }, optional: false, nullable: false, api_name: "$error"
    end
  end
end
