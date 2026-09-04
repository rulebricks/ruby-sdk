# frozen_string_literal: true

module Rulebricks
  module Assets
    module Types
      class ImportRbmAssetsResponse < Internal::Types::Model
        extend Rulebricks::Internal::Types::Union

        member -> { Rulebricks::Types::ImportManifestResponse }

        member -> { Rulebricks::Types::ImportManifestPreviewResponse }
      end
    end
  end
end
