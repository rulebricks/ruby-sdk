# frozen_string_literal: true

module Rulebricks
  module Types
    class ParallelSolveRequestValue < Internal::Types::Model
      field :rule, -> { String }, optional: true, nullable: false, api_name: "$rule"
      field :flow, -> { String }, optional: true, nullable: false, api_name: "$flow"
    end
  end
end
