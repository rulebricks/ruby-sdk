# frozen_string_literal: true

module Rulebricks
  module Types
    class ImportManifestResponse < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :created, -> { Internal::Types::Array[Rulebricks::Types::ImportManifestResponseCreatedItem] }, optional: true, nullable: false
      field :updated, -> { Internal::Types::Array[Rulebricks::Types::ImportManifestResponseUpdatedItem] }, optional: true, nullable: false
      field :skipped, -> { Internal::Types::Array[Rulebricks::Types::ImportManifestResponseSkippedItem] }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Rulebricks::Types::ImportManifestResponseErrorsItem] }, optional: true, nullable: false
      field :warnings, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :organization_created, -> { Rulebricks::Types::ImportManifestResponseOrganizationCreated }, optional: true, nullable: false
    end
  end
end
