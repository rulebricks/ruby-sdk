# frozen_string_literal: true

module Rulebricks
  module Types
    class ImportManifestPreviewResponse < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :preview, -> { Rulebricks::Types::ImportManifestPreviewResponsePreview }, optional: false, nullable: false
    end
  end
end
