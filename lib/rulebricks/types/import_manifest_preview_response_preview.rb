# frozen_string_literal: true

module Rulebricks
  module Types
    class ImportManifestPreviewResponsePreview < Internal::Types::Model
      field :policy, -> { Rulebricks::Types::ImportManifestPreviewResponsePreviewPolicy }, optional: false, nullable: false

      field :executable, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :partial, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :summary, -> { Internal::Types::Hash[String, Integer] }, optional: false, nullable: false

      field :items, -> { Internal::Types::Array[Rulebricks::Types::ImportManifestPreviewResponsePreviewItemsItem] }, optional: false, nullable: false

      field :issues, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false

      field :warnings, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
