# frozen_string_literal: true

module Rulebricks
  module Types
    # Result of a sync call. For dry runs, counts describe what would happen.
    class SyncValuesResponse < Internal::Types::Model
      field :collection, -> { String }, optional: true, nullable: false

      field :sync_id, -> { String }, optional: true, nullable: false

      field :already_completed, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :dry_run, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :swept, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :created, -> { Integer }, optional: true, nullable: false

      field :updated, -> { Integer }, optional: true, nullable: false

      field :unchanged, -> { Integer }, optional: true, nullable: false

      field :processed, -> { Integer }, optional: true, nullable: false

      field :archived, -> { Integer }, optional: true, nullable: false

      field :deleted, -> { Integer }, optional: true, nullable: false

      field :blocked, -> { Internal::Types::Array[Rulebricks::Types::SyncValuesResponseBlockedItem] }, optional: true, nullable: false

      field :errors, -> { Internal::Types::Array[Rulebricks::Types::SyncValuesResponseErrorsItem] }, optional: true, nullable: false
    end
  end
end
