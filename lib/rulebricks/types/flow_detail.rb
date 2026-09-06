# frozen_string_literal: true

module Rulebricks
  module Types
    class FlowDetail < Internal::Types::Model
      field :request_schema, -> { Internal::Types::Array[Rulebricks::Types::SchemaField] }, optional: true, nullable: false

      field :published, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false

      field :labels, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :origin_rule, -> { Rulebricks::Types::FlowDetailOriginRule }, optional: true, nullable: false

      field :context, -> { Rulebricks::Types::FlowDetailContext }, optional: true, nullable: false

      field :user_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :folder, -> { Rulebricks::Types::Folder }, optional: true, nullable: false
    end
  end
end
