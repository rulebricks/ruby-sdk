# frozen_string_literal: true

module Rulebricks
  module Types
    # The origin rule that this flow starts from. Flows execute starting from this rule's outputs.
    class FlowDetailOriginRule < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :slug, -> { String }, optional: true, nullable: false
    end
  end
end
