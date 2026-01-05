# frozen_string_literal: true

module Rulebricks
  module Types
    # Summary of a context for listing. Uses counts instead of full arrays.
    class ContextListItem < Internal::Types::Model
      field :identity_fact, -> { String }, optional: true, nullable: false
      field :schema, -> { Rulebricks::Types::ContextSchema }, optional: true, nullable: false
      field :folder, -> { Rulebricks::Types::ContextListItemFolder }, optional: true, nullable: false
      field :bound_rules_count, -> { Integer }, optional: true, nullable: false
      field :bound_flows_count, -> { Integer }, optional: true, nullable: false
      field :relationships_count, -> { Integer }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
