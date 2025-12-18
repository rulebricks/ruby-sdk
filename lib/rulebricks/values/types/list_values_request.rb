# frozen_string_literal: true

module Rulebricks
  module Values
    module Types
      class ListValuesRequest < Internal::Types::Model
        field :name, -> { String }, optional: true, nullable: false
        field :include, -> { String }, optional: true, nullable: false
      end
    end
  end
end
