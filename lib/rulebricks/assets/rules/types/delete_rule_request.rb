# frozen_string_literal: true

module Rulebricks
  module Assets
    module Rules
      module Types
        class DeleteRuleRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
