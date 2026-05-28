# frozen_string_literal: true

module Rulebricks
  module Types
    # The exported manifest data. The wrapper uses snake_case, while asset objects inside `contexts`, `values`, `rules`,
    # and `flows` intentionally preserve `.rbm`/database casing for round-trip compatibility.
    class ExportManifestResponseManifest < Internal::Types::Model
      field :version, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :exported_at, -> { String }, optional: true, nullable: false

      field :contexts, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false

      field :values, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false

      field :rules, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false

      field :flows, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
    end
  end
end
