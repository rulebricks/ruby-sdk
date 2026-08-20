# frozen_string_literal: true

module Rulebricks
  module Types
    class UpsertObjectResponse < Internal::Types::Model
      field :dry_run, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :created, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :object, -> { Rulebricks::Types::WorkspaceObject }, optional: true, nullable: false

      field :values, -> { Rulebricks::Types::UpsertObjectResponseValues }, optional: true, nullable: false
    end
  end
end
