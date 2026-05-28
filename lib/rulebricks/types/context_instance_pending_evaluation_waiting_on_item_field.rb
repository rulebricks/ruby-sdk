# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextInstancePendingEvaluationWaitingOnItemField < Internal::Types::Model
      field :field, -> { String }, optional: true, nullable: false

      field :relation, -> { String }, optional: true, nullable: false

      field :instance, -> { String }, optional: true, nullable: false
    end
  end
end
