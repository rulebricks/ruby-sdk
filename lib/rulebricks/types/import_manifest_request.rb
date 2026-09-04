# frozen_string_literal: true

module Rulebricks
  module Types
    class ImportManifestRequest < Internal::Types::Model
      field :manifest, -> { Rulebricks::Types::ImportManifestRequestManifest }, optional: false, nullable: false

      field :conflict_strategy, -> { Rulebricks::Types::ImportManifestRequestConflictStrategy }, optional: true, nullable: false

      field :target_folder_name, -> { String }, optional: true, nullable: false

      field :parent_folder_id, -> { String }, optional: true, nullable: false

      field :clear_history, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :preview_only, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
