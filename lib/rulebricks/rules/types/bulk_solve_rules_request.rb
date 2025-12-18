# frozen_string_literal: true

module Rulebricks
  module Rules
    module Types
      class BulkSolveRulesRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false
        field :body, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false
      end
    end
  end
end
