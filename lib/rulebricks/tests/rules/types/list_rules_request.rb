# frozen_string_literal: true

module Rulebricks
  module Tests
    module Rules
      module Types
        class ListRulesRequest < Internal::Types::Model
          field :slug, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
