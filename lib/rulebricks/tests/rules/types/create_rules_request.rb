# frozen_string_literal: true

module Rulebricks
  module Tests
    module Rules
      module Types
        class CreateRulesRequest < Internal::Types::Model
          field :slug, -> { String }, optional: false, nullable: false
          field :body, -> { Rulebricks::Types::CreateTestRequest }, optional: false, nullable: false
        end
      end
    end
  end
end
