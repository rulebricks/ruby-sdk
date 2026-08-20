# frozen_string_literal: true

module Rulebricks
  module Types
    class ManifestLabeledAssetData < Internal::Types::Model
      field :labels, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
