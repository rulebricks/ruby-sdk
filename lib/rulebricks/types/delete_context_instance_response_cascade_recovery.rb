# frozen_string_literal: true

module Rulebricks
  module Types
    # Information needed to reconcile dependent work after physical source deletion. Retain this response; an identical
    # delete cannot reconstruct removed facts.
    class DeleteContextInstanceResponseCascadeRecovery < Internal::Types::Model
      field :context, -> { String }, optional: true, nullable: false

      field :previous_state, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :action, -> { String }, optional: true, nullable: false
    end
  end
end
