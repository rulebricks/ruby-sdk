# frozen_string_literal: true

module Rulebricks
  module Assets
    module Types
      class ExportRbmAssetsResponse < Internal::Types::Model
        extend Rulebricks::Internal::Types::Union

        member -> { Rulebricks::Types::ExportManifestResponse }

        member -> { Rulebricks::Types::ExportManifestPreviewResponse }
      end
    end
  end
end
