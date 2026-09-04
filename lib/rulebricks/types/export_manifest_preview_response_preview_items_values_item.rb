# frozen_string_literal: true

module Rulebricks
  module Types
    class ExportManifestPreviewResponsePreviewItemsValuesItem < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :stable_id, -> { String }, optional: true, nullable: false, api_name: "stableId"

      field :name, -> { String }, optional: true, nullable: false

      field :type, -> { String }, optional: true, nullable: false

      field :value_type, -> { String }, optional: true, nullable: false, api_name: "valueType"

      field :value, -> { Object }, optional: true, nullable: false
    end
  end
end
