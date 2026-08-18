# frozen_string_literal: true

module Rulebricks
  module Types
    # Managed-value sync results (or would_sync / would_archive for dry runs).
    class UpsertObjectResponseValues < Internal::Types::Model
      field :synced, -> { Integer }, optional: true, nullable: false

      field :archived, -> { Integer }, optional: true, nullable: false

      field :would_sync, -> { Integer }, optional: true, nullable: false

      field :would_archive, -> { Internal::Types::Array[Rulebricks::Types::UpsertObjectResponseValuesWouldArchiveItem] }, optional: true, nullable: false
    end
  end
end
