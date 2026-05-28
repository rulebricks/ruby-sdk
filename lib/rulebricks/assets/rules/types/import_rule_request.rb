# frozen_string_literal: true

module Rulebricks
  module Assets
    module Rules
      module Types
        class ImportRuleRequest < Internal::Types::Model
          field :rule, -> { Rulebricks::Types::RuleImportPayload }, optional: false, nullable: false
        end
      end
    end
  end
end
