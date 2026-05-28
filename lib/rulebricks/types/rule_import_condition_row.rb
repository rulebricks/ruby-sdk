# frozen_string_literal: true

module Rulebricks
  module Types
    # A single rule row containing request conditions and response output.
    class RuleImportConditionRow < Internal::Types::Model
      field :request, -> { Internal::Types::Hash[String, Rulebricks::Types::RuleImportRequestCell] }, optional: false, nullable: false

      field :response, -> { Internal::Types::Hash[String, Rulebricks::Types::RuleImportResponseCell] }, optional: false, nullable: false

      field :settings, -> { Rulebricks::Types::RuleImportRowSettings }, optional: false, nullable: false
    end
  end
end
