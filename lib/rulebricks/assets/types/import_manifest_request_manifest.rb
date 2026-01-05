# frozen_string_literal: true

module Rulebricks
  module Assets
    module Types
      # The RBM manifest object containing assets to import.
      class ImportManifestRequestManifest < Internal::Types::Model
        field :version, -> { String }, optional: true, nullable: false
        field :rules, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
        field :flows, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
        field :entities, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
        field :values, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
      end
    end
  end
end
