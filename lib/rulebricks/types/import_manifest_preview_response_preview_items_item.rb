# frozen_string_literal: true

module Rulebricks
  module Types
    class ImportManifestPreviewResponsePreviewItemsItem < Internal::Types::Model
      field :key, -> { String }, optional: true, nullable: false

      field :type, -> { Rulebricks::Types::ImportManifestPreviewResponsePreviewItemsItemType }, optional: true, nullable: false

      field :source_index, -> { Integer }, optional: true, nullable: false

      field :stable_id, -> { String }, optional: true, nullable: false

      field :operation, -> { Rulebricks::Types::ImportManifestPreviewResponsePreviewItemsItemOperation }, optional: true, nullable: false

      field :final, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
