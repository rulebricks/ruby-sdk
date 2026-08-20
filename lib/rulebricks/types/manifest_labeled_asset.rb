# frozen_string_literal: true

module Rulebricks
  module Types
    # A rule or flow entry in an RBM manifest. The full asset document is preserved for round-trip compatibility.
    class ManifestLabeledAsset < Internal::Types::Model
      field :data, -> { Rulebricks::Types::ManifestLabeledAssetData }, optional: true, nullable: false
    end
  end
end
