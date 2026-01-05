# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Types
      class CascadeContextsRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false
        field :instance, -> { String }, optional: false, nullable: false
        field :body, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      end
    end
  end
end
