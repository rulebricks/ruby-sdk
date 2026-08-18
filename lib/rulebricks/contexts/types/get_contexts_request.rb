# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Types
      class GetContextsRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false

        field :instance, -> { String }, optional: false, nullable: false

        field :include_relations, -> { String }, optional: true, nullable: false
      end
    end
  end
end
