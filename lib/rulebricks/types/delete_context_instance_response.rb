# frozen_string_literal: true

module Rulebricks
  module Types
    # Response after deleting a context instance.
    class DeleteContextInstanceResponse < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false

      field :pending_evaluations_cancelled, -> { Integer }, optional: true, nullable: false
    end
  end
end
