# frozen_string_literal: true

module Rulebricks
  module Types
    class ExportManifestPreviewResponsePreviewCounts < Internal::Types::Model
      field :rules, -> { Integer }, optional: true, nullable: false

      field :flows, -> { Integer }, optional: true, nullable: false

      field :contexts, -> { Integer }, optional: true, nullable: false

      field :values, -> { Integer }, optional: true, nullable: false
    end
  end
end
