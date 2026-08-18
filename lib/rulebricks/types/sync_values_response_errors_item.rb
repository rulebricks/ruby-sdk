# frozen_string_literal: true

module Rulebricks
  module Types
    class SyncValuesResponseErrorsItem < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
