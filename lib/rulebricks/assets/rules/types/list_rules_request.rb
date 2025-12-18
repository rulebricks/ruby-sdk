# frozen_string_literal: true

module Rulebricks
  module Assets
    module Rules
      module Types
        class ListRulesRequest < Internal::Types::Model
          field :folder, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
