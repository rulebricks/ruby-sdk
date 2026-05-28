# frozen_string_literal: true

module Rulebricks
  module Types
    # A response cell in a condition row.
    class RuleImportResponseCell < Internal::Types::Model
      field :value, -> { Object }, optional: false, nullable: false
    end
  end
end
