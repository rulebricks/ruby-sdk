# frozen_string_literal: true

module Rulebricks
  module Types
    # Details of the per-entity failure.
    class ParallelSolveEntityErrorError < Internal::Types::Model
      field :message, -> { String }, optional: false, nullable: false

      field :status, -> { Integer }, optional: false, nullable: false
    end
  end
end
