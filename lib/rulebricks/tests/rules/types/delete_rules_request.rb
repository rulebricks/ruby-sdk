# frozen_string_literal: true

module Rulebricks
  module Tests
    module Rules
      module Types
        class DeleteRulesRequest < Internal::Types::Model
          field :slug, -> { String }, optional: false, nullable: false
          field :test_id, -> { String }, optional: false, nullable: false, api_name: "testId"
        end
      end
    end
  end
end
