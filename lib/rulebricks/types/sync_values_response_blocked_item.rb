# frozen_string_literal: true

module Rulebricks
  module Types
    class SyncValuesResponseBlockedItem < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :reason, -> { String }, optional: true, nullable: false

      field :action, -> { Rulebricks::Types::SyncValuesResponseBlockedItemAction }, optional: true, nullable: false
    end
  end
end
