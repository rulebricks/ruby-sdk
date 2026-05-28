# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Types
      class SolveContextsRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false

        field :instance, -> { String }, optional: false, nullable: false

        field :rule_slug, -> { String }, optional: false, nullable: false, api_name: "ruleSlug"

        field :body, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      end
    end
  end
end
