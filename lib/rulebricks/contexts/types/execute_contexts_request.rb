# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Types
      class ExecuteContextsRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false

        field :instance, -> { String }, optional: false, nullable: false

        field :flow_slug, -> { String }, optional: false, nullable: false, api_name: "flowSlug"

        field :body, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      end
    end
  end
end
