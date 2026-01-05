# frozen_string_literal: true

module Rulebricks
  module Types
    class ExportManifestResponse < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :manifest, -> { Rulebricks::Types::ExportManifestResponseManifest }, optional: true, nullable: false
      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
