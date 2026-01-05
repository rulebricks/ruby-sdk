# frozen_string_literal: true

module Rulebricks
  module Types
    # Preview of assets that would be exported.
    class ExportManifestPreviewResponsePreview < Internal::Types::Model
      field :counts, -> { Rulebricks::Types::ExportManifestPreviewResponsePreviewCounts }, optional: true, nullable: false
      field :items, -> { Rulebricks::Types::ExportManifestPreviewResponsePreviewItems }, optional: true, nullable: false
    end
  end
end
