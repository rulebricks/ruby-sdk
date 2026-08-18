# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextBatchResponseRejectionsItem < Internal::Types::Model
      field :position, -> { Integer }, optional: true, nullable: false

      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
