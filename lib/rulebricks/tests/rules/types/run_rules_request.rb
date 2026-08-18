# frozen_string_literal: true

module Rulebricks
  module Tests
    module Rules
      module Types
        class RunRulesRequest < Internal::Types::Model
          field :slug, -> { String }, optional: false, nullable: false

          field :body, -> { Rulebricks::Types::RunTestsRequest }, optional: false, nullable: false
        end
      end
    end
  end
end
