# frozen_string_literal: true

module Rulebricks
  module Assets
    module Types
      class ImportManifestRequestLegacyRuleMappingValue < Internal::Types::Model
        field :action, -> { Rulebricks::Assets::Types::ImportManifestRequestLegacyRuleMappingValueAction }, optional: true, nullable: false
        field :rule_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
