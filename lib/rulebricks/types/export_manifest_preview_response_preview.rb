# frozen_string_literal: true

module Rulebricks
  module Types
    # Preview of assets that would be exported. The preview wrapper uses snake_case, while asset items intentionally
    # preserve `.rbm`/database casing (for example, `valueType` and `updatedAt`) because the same items feed manifest
    # preview/import UI.
    class ExportManifestPreviewResponsePreview < Internal::Types::Model
      field :counts, -> { Rulebricks::Types::ExportManifestPreviewResponsePreviewCounts }, optional: true, nullable: false

      field :items, -> { Rulebricks::Types::ExportManifestPreviewResponsePreviewItems }, optional: true, nullable: false
    end
  end
end
