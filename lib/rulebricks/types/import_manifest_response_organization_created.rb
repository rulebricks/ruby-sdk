# frozen_string_literal: true

module Rulebricks
  module Types
    # IDs of any organizational folders created during import.
    class ImportManifestResponseOrganizationCreated < Internal::Types::Model
      field :entity_set_id, -> { String }, optional: true, nullable: false
      field :rule_tag_id, -> { String }, optional: true, nullable: false
      field :flow_tag_id, -> { String }, optional: true, nullable: false
    end
  end
end
