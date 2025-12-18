# frozen_string_literal: true

module Rulebricks
  module Types
    class RuleDetail < Internal::Types::Model
      field :created_at, -> { String }, optional: true, nullable: false
      field :folder, -> { Rulebricks::Types::Folder }, optional: true, nullable: false
      field :request_schema, -> { Internal::Types::Array[Rulebricks::Types::SchemaField] }, optional: true, nullable: false
      field :response_schema, -> { Internal::Types::Array[Rulebricks::Types::SchemaField] }, optional: true, nullable: false
    end
  end
end
