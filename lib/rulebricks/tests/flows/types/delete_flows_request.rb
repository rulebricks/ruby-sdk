# frozen_string_literal: true

module Rulebricks
  module Tests
    module Flows
      module Types
        class DeleteFlowsRequest < Internal::Types::Model
          field :slug, -> { String }, optional: false, nullable: false
          field :test_id, -> { String }, optional: false, nullable: false, api_name: "testId"
        end
      end
    end
  end
end
