# frozen_string_literal: true

module Rulebricks
  module Types
    # The context this rule is bound to (if any). Rules bound to a context have their inputs/outputs mapped to context
    # fields.
    class RuleDetailContext < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :slug, -> { String }, optional: true, nullable: false
    end
  end
end
