# frozen_string_literal: true

module Rulebricks
  module Types
    class RuleDetail < Internal::Types::Model
      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false

      field :published, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :no_conditions, -> { Integer }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :user_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :folder, -> { Rulebricks::Types::Folder }, optional: true, nullable: false

      field :context, -> { Rulebricks::Types::RuleDetailContext }, optional: true, nullable: false

      field :request_schema, -> { Internal::Types::Array[Rulebricks::Types::SchemaField] }, optional: true, nullable: false

      field :response_schema, -> { Internal::Types::Array[Rulebricks::Types::SchemaField] }, optional: true, nullable: false
    end
  end
end
