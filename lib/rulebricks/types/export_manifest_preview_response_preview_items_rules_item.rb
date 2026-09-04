# frozen_string_literal: true

module Rulebricks
  module Types
    class ExportManifestPreviewResponsePreviewItemsRulesItem < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :stable_id, -> { String }, optional: true, nullable: false, api_name: "stableId"

      field :name, -> { String }, optional: true, nullable: false

      field :slug, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :published, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :row_count, -> { Integer }, optional: true, nullable: false, api_name: "rowCount"

      field :version_count, -> { Integer }, optional: true, nullable: false, api_name: "versionCount"

      field :updated_at, -> { String }, optional: true, nullable: false, api_name: "updatedAt"
    end
  end
end
