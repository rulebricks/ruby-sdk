# frozen_string_literal: true

module Rulebricks
  module Types
    class ExportManifestPreviewResponsePreviewItems < Internal::Types::Model
      field :rules, -> { Internal::Types::Array[Rulebricks::Types::ExportManifestPreviewResponsePreviewItemsRulesItem] }, optional: true, nullable: false
      field :flows, -> { Internal::Types::Array[Rulebricks::Types::ExportManifestPreviewResponsePreviewItemsFlowsItem] }, optional: true, nullable: false
      field :contexts, -> { Internal::Types::Array[Rulebricks::Types::ExportManifestPreviewResponsePreviewItemsContextsItem] }, optional: true, nullable: false
      field :values, -> { Internal::Types::Array[Rulebricks::Types::ExportManifestPreviewResponsePreviewItemsValuesItem] }, optional: true, nullable: false
    end
  end
end
