# frozen_string_literal: true

module Rulebricks
  module Types
    # Rulebricks Flow Schema definition accepted by /admin/flows/import. If `id` is provided the matching flow is
    # updated; otherwise a new flow is created. The server expands this into the full flow graph and (unless `_publish`
    # is false) publishes it so it is immediately executable.
    class FlowImportPayload < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :nodes, -> { Internal::Types::Array[Rulebricks::Types::RulebricksFlowNode] }, optional: false, nullable: false

      field :connections, -> { Internal::Types::Array[Rulebricks::Types::RulebricksFlowConnection] }, optional: true, nullable: false

      field :publish, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "_publish"

      field :id, -> { String }, optional: true, nullable: false

      field :stable_id, -> { String }, optional: true, nullable: false

      field :slug, -> { String }, optional: true, nullable: false
    end
  end
end
