# frozen_string_literal: true

module Rulebricks
  module Assets
    module Types
      # The RBM manifest object containing assets to import. Asset objects inside the manifest intentionally preserve
      # `.rbm`/database casing so exported manifests can be imported without rewriting asset payloads. A compressed
      # manifest is also accepted: the JSON array produced by the compress-json library (for example, the contents of a
      # compressed .rbm file exported with `compress: true`); it is detected and decompressed automatically.
      class ImportManifestRequestManifest < Internal::Types::Model
        field :version, -> { String }, optional: true, nullable: false

        field :rules, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false

        field :flows, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false

        field :entities, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false

        field :contexts, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false

        field :values, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
      end
    end
  end
end
