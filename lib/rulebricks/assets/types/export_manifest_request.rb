# frozen_string_literal: true

module Rulebricks
  module Assets
    module Types
      class ExportManifestRequest < Internal::Types::Model
        field :root_type, -> { Rulebricks::Assets::Types::ExportManifestRequestRootType }, optional: false, nullable: false

        field :root_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

        field :include_downstream, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :manifest_name, -> { String }, optional: true, nullable: false

        field :manifest_description, -> { String }, optional: true, nullable: false

        field :preview_only, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
