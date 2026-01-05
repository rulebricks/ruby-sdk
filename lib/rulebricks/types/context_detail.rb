# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextDetail < Internal::Types::Model
      field :schema, -> { Rulebricks::Types::ContextSchema }, optional: true, nullable: false
      field :identity_fact, -> { String }, optional: true, nullable: false
      field :user_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :folder, -> { Rulebricks::Types::ContextDetailFolder }, optional: true, nullable: false
      field :bound_rules, -> { Internal::Types::Array[Rulebricks::Types::ContextDetailBoundRulesItem] }, optional: true, nullable: false
      field :bound_flows, -> { Internal::Types::Array[Rulebricks::Types::ContextDetailBoundFlowsItem] }, optional: true, nullable: false
      field :relationships, -> { Rulebricks::Types::ContextDetailRelationships }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
