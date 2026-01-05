# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Types
      class GetHistoryContextsRequest < Internal::Types::Model
        field :slug, -> { String }, optional: false, nullable: false
        field :instance, -> { String }, optional: false, nullable: false
        field :field, -> { String }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
