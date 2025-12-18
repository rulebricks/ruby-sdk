# frozen_string_literal: true

module Rulebricks
  module Tests
    module Flows
      module Types
        class CreateFlowsRequest < Internal::Types::Model
          field :slug, -> { String }, optional: false, nullable: false
          field :body, -> { Rulebricks::Types::CreateTestRequest }, optional: false, nullable: false
        end
      end
    end
  end
end
