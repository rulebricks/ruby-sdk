# frozen_string_literal: true

module Rulebricks
  module Types
    # The context this flow is bound to (via its origin rule). Flows inherit context binding from their origin rule.
    class FlowDetailContext < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :slug, -> { String }, optional: true, nullable: false
    end
  end
end
