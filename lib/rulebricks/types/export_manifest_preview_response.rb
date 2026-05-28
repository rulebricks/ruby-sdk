# frozen_string_literal: true

module Rulebricks
  module Types
    class ExportManifestPreviewResponse < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :preview, -> { Rulebricks::Types::ExportManifestPreviewResponsePreview }, optional: true, nullable: false

      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
