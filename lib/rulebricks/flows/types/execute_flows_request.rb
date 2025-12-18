# frozen_string_literal: true

module Rulebricks
  module Flows
    module Types
      class ExecuteFlowsRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false
        field :body, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      end
    end
  end
end
