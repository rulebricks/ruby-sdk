# frozen_string_literal: true

module Rulebricks
  module Assets
    module Types
      class ImportManifestRequest < Internal::Types::Model
        field :manifest, -> { Rulebricks::Assets::Types::ImportManifestRequestManifest }, optional: false, nullable: false
        field :conflict_strategy, -> { Rulebricks::Assets::Types::ImportManifestRequestConflictStrategy }, optional: true, nullable: false
        field :target_folder_name, -> { String }, optional: true, nullable: false
        field :legacy_rule_mapping, -> { Internal::Types::Hash[String, Rulebricks::Assets::Types::ImportManifestRequestLegacyRuleMappingValue] }, optional: true, nullable: false
      end
    end
  end
end
