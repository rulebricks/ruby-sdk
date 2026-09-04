# frozen_string_literal: true

module Rulebricks
  module Types
    class ExportManifestPreviewResponsePreviewItemsContextsItem < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :stable_id, -> { String }, optional: true, nullable: false, api_name: "stableId"

      field :name, -> { String }, optional: true, nullable: false

      field :slug, -> { String }, optional: true, nullable: false

      field :field_count, -> { Integer }, optional: true, nullable: false, api_name: "fieldCount"

      field :identity_field, -> { String }, optional: true, nullable: false
    end
  end
end
