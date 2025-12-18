# frozen_string_literal: true

module Rulebricks
  module Assets
    module Rules
      module Types
        class ImportRuleRequest < Internal::Types::Model
          field :rule, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
        end
      end
    end
  end
end
