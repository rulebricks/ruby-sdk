# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Types
      class BulkIngestContextsRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false

        field :include, -> { String }, optional: true, nullable: false

        field :body, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false
      end
    end
  end
end
